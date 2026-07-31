import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imsh/app_router.gr.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../core/storage/token_storage.dart';
import '../../core/theme/app_design_tokens.dart';
import '../../core/theme/context_extensions.dart';
import '../../helper/date_formatter.dart';
import '../../models/emergency_request_model.dart';
import '../../providers/emergency_provider.dart';
import '../../providers/service_providers.dart';
import '../../services/api_service.dart';
import '../../shared/widgets/imsh_app_bar.dart';
import '../../shared/widgets/imsh_semantic_badge.dart';
import '../../shared/widgets/imsh_surface_card.dart';

@RoutePage()
class EmergencyRequestsScreen extends ConsumerWidget {
  const EmergencyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(emergencyStatusFilterProvider);
    final listAsync = ref.watch(emergencyListProvider(status));

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Emergency services')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.colorScheme.error,
        foregroundColor: context.colorScheme.onError,
        onPressed: () => context.router.push(const CreateEmergencyRequestRoute()),
        icon: const Icon(Icons.emergency_outlined),
        label: const Text('Request help'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(emergencyListProvider(status));
          await ref.read(emergencyListProvider(status).future);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            AppDesignTokens.containerPadding,
            AppDesignTokens.containerPadding,
            AppDesignTokens.containerPadding,
            AppDesignTokens.spacing2xl * 2,
          ),
          children: [
            Text(
              'Request an ambulance or emergency response. Share your location and describe what is wrong with text, a voice note, or a short video.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap(AppDesignTokens.spacingMd),
            _StatusFilters(status: status),
            const Gap(AppDesignTokens.spacingMd),
            listAsync.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppDesignTokens.spacingXl),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, _) => _ErrorState(
                message: emergencyErrorMessage(error),
                onRetry: () => ref.invalidate(emergencyListProvider(status)),
              ),
              data: (response) {
                if (response.data.isEmpty) {
                  return const _EmptyState();
                }
                return Column(
                  children: [
                    for (final item in response.data) ...[
                      _RequestCard(item: item),
                      const Gap(AppDesignTokens.spacingMd),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class CreateEmergencyRequestScreen extends ConsumerStatefulWidget {
  const CreateEmergencyRequestScreen({super.key});

  @override
  ConsumerState<CreateEmergencyRequestScreen> createState() =>
      _CreateEmergencyRequestScreenState();
}

class _CreateEmergencyRequestScreenState
    extends ConsumerState<CreateEmergencyRequestScreen> {
  final _descriptionController = TextEditingController();
  final _recorder = AudioRecorder();
  final _picker = ImagePicker();

  Position? _position;
  String? _locationError;
  bool _locating = false;
  bool _recording = false;
  String? _voicePath;
  String? _videoPath;
  Duration _recordElapsed = Duration.zero;
  Timer? _recordTimer;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _captureLocation();
  }

  @override
  void dispose() {
    _recordTimer?.cancel();
    _descriptionController.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _captureLocation() async {
    setState(() {
      _locating = true;
      _locationError = null;
    });
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) {
        setState(() {
          _locationError = 'Turn on location services to request help.';
          _locating = false;
        });
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _locationError =
              'Location permission is required so ED can find you.';
          _locating = false;
        });
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      if (!mounted) return;
      setState(() {
        _position = position;
        _locating = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _locationError = 'Could not get location. Try again.';
        _locating = false;
      });
    }
  }

  Future<void> _toggleRecording() async {
    if (_recording) {
      final path = await _recorder.stop();
      _recordTimer?.cancel();
      setState(() {
        _recording = false;
        _voicePath = path;
      });
      return;
    }

    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission is required.')),
      );
      return;
    }

    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/emergency_voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: path,
    );
    _recordElapsed = Duration.zero;
    _recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _recordElapsed += const Duration(seconds: 1));
      if (_recordElapsed.inSeconds >= 120) {
        _toggleRecording();
      }
    });
    setState(() {
      _recording = true;
      _voicePath = null;
    });
  }

  Future<void> _pickVideo() async {
    final file = await _picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 30),
    );
    if (file == null) return;
    setState(() => _videoPath = file.path);
  }

  Future<void> _submit() async {
    final description = _descriptionController.text.trim();
    final payload = CreateEmergencyRequestPayload(
      latitude: _position?.latitude ?? 0,
      longitude: _position?.longitude ?? 0,
      accuracyMeters: _position?.accuracy,
      description: description.isEmpty ? null : description,
      voicePath: _voicePath,
      videoPath: _videoPath,
    );

    if (_position == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wait for your location to be captured.')),
      );
      return;
    }
    if (!payload.hasAttachment) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add a text description, voice note, or video.'),
        ),
      );
      return;
    }

    setState(() => _submitting = true);
    try {
      final saved = await ref
          .read(submitEmergencyProvider.notifier)
          .submit(payload);
      if (!mounted) return;
      context.router.replace(EmergencyRequestDetailRoute(id: saved.id));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(emergencyErrorMessage(error))),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Request emergency help')),
      body: ListView(
        padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
        children: [
          ImshSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your location',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                if (_locating)
                  const Row(
                    children: [
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      Gap(AppDesignTokens.spacingSm),
                      Text('Getting precise location…'),
                    ],
                  )
                else if (_position != null)
                  Text(
                    '${_position!.latitude.toStringAsFixed(5)}, '
                    '${_position!.longitude.toStringAsFixed(5)}'
                    '${_position!.accuracy > 0 ? ' (±${_position!.accuracy.toStringAsFixed(0)} m)' : ''}',
                  )
                else
                  Text(
                    _locationError ?? 'Location unavailable',
                    style: TextStyle(color: colorScheme.error),
                  ),
                const Gap(AppDesignTokens.spacingSm),
                TextButton.icon(
                  onPressed: _locating ? null : _captureLocation,
                  icon: const Icon(Icons.my_location),
                  label: const Text('Refresh location'),
                ),
              ],
            ),
          ),
          const Gap(AppDesignTokens.spacingLg),
          Text(
            'What is wrong? (provide at least one)',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Gap(AppDesignTokens.spacingSm),
          TextField(
            controller: _descriptionController,
            maxLines: 4,
            maxLength: 2000,
            decoration: const InputDecoration(
              hintText: 'Describe the emergency…',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          ImshSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Voice note (optional, max 2 min)',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                Row(
                  children: [
                    FilledButton.tonalIcon(
                      onPressed: _submitting ? null : _toggleRecording,
                      icon: Icon(_recording ? Icons.stop : Icons.mic),
                      label: Text(_recording ? 'Stop' : 'Record'),
                    ),
                    const Gap(AppDesignTokens.spacingMd),
                    if (_recording)
                      Text(
                        '${_recordElapsed.inMinutes}:'
                        '${(_recordElapsed.inSeconds % 60).toString().padLeft(2, '0')}',
                      )
                    else if (_voicePath != null)
                      const Expanded(child: Text('Voice note attached')),
                    if (_voicePath != null && !_recording)
                      IconButton(
                        onPressed: () => setState(() => _voicePath = null),
                        icon: const Icon(Icons.delete_outline),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(AppDesignTokens.spacingMd),
          ImshSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Short video (optional, max 30 s)',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(AppDesignTokens.spacingSm),
                Row(
                  children: [
                    FilledButton.tonalIcon(
                      onPressed: _submitting ? null : _pickVideo,
                      icon: const Icon(Icons.videocam_outlined),
                      label: Text(_videoPath == null ? 'Record video' : 'Retake'),
                    ),
                    if (_videoPath != null) ...[
                      const Gap(AppDesignTokens.spacingMd),
                      const Expanded(child: Text('Video attached')),
                      IconButton(
                        onPressed: () => setState(() => _videoPath = null),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const Gap(AppDesignTokens.spacing2xl),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
              minimumSize: const Size.fromHeight(52),
            ),
            onPressed: _submitting ? null : _submit,
            icon: _submitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send_outlined),
            label: Text(_submitting ? 'Sending…' : 'Send to ED'),
          ),
        ],
      ),
    );
  }
}

@RoutePage()
class EmergencyRequestDetailScreen extends ConsumerWidget {
  const EmergencyRequestDetailScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(emergencyDetailProvider(id));
    final isCancelling =
        ref.watch(cancelEmergencyProvider).valueOrNull?.contains(id) ?? false;

    return Scaffold(
      appBar: ImshAppBar(title: const Text('Emergency request')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorState(
          message: emergencyErrorMessage(error),
          onRetry: () => ref.invalidate(emergencyDetailProvider(id)),
        ),
        data: (request) {
          final canCancel = request.status == EmergencyRequestStatus.submitted;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppDesignTokens.containerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Emergency request',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    _StatusBadge(status: request.status),
                  ],
                ),
                const Gap(AppDesignTokens.spacingLg),
                _DetailBlock(
                  title: 'Submitted',
                  value: request.createdAt == null
                      ? 'Unknown'
                      : DateFormatter.dateTime(request.createdAt!),
                ),
                const Gap(AppDesignTokens.spacingMd),
                _DetailBlock(
                  title: 'Location',
                  value:
                      '${request.latitude.toStringAsFixed(5)}, '
                      '${request.longitude.toStringAsFixed(5)}',
                ),
                TextButton.icon(
                  onPressed: () => _openMaps(
                    request.latitude,
                    request.longitude,
                  ),
                  icon: const Icon(Icons.map_outlined),
                  label: const Text('Open in maps'),
                ),
                if (request.description?.isNotEmpty == true) ...[
                  const Gap(AppDesignTokens.spacingMd),
                  _DetailBlock(
                    title: 'Description',
                    value: request.description!,
                  ),
                ],
                if (request.voiceUrl != null) ...[
                  const Gap(AppDesignTokens.spacingMd),
                  _AuthenticatedAudioPlayer(requestId: id),
                ],
                if (request.videoUrl != null) ...[
                  const Gap(AppDesignTokens.spacingMd),
                  _AuthenticatedVideoPlayer(requestId: id),
                ],
                if (request.staffNote?.isNotEmpty == true) ...[
                  const Gap(AppDesignTokens.spacingLg),
                  ImshSurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ED update',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const Gap(AppDesignTokens.spacingSm),
                        Text(request.staffNote!),
                        if (request.respondedBy != null) ...[
                          const Gap(AppDesignTokens.spacingSm),
                          Text(
                            'By ${request.respondedBy!.displayName}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
                if (canCancel) ...[
                  const Gap(AppDesignTokens.spacing2xl),
                  OutlinedButton.icon(
                    onPressed: isCancelling
                        ? null
                        : () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: const Text('Cancel request?'),
                                content: const Text(
                                  'Only cancel if you no longer need emergency help.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(false),
                                    child: const Text('Keep'),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(true),
                                    child: const Text('Cancel request'),
                                  ),
                                ],
                              ),
                            );
                            if (confirmed != true) return;
                            await ref
                                .read(cancelEmergencyProvider.notifier)
                                .cancel(id);
                          },
                    icon: const Icon(Icons.cancel_outlined),
                    label: Text(
                      isCancelling ? 'Cancelling…' : 'Cancel request',
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _openMaps(double lat, double lng) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _StatusFilters extends ConsumerWidget {
  const _StatusFilters({required this.status});

  final EmergencyRequestStatus? status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = <(EmergencyRequestStatus?, String)>[
      (null, 'All'),
      (EmergencyRequestStatus.submitted, 'Submitted'),
      (EmergencyRequestStatus.acknowledged, 'Acknowledged'),
      (EmergencyRequestStatus.dispatched, 'Dispatched'),
      (EmergencyRequestStatus.closed, 'Closed'),
      (EmergencyRequestStatus.cancelled, 'Cancelled'),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final option in options) ...[
            FilterChip(
              label: Text(option.$2),
              selected: status == option.$1,
              onSelected: (_) {
                ref.read(emergencyStatusFilterProvider.notifier).state =
                    option.$1;
              },
            ),
            const Gap(AppDesignTokens.spacingSm),
          ],
        ],
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  const _RequestCard({required this.item});

  final EmergencyRequest item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesignTokens.radiusLg),
        onTap: () =>
            context.router.push(EmergencyRequestDetailRoute(id: item.id)),
        child: ImshSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.description?.isNotEmpty == true
                          ? item.description!
                          : 'Emergency request',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _StatusBadge(status: item.status),
                ],
              ),
              const Gap(AppDesignTokens.spacingSm),
              Text(
                item.createdAt == null
                    ? 'Unknown time'
                    : DateFormatter.dateTime(item.createdAt!),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final EmergencyRequestStatus status;

  @override
  Widget build(BuildContext context) {
    final tone = switch (status) {
      EmergencyRequestStatus.submitted => ImshSemanticTone.error,
      EmergencyRequestStatus.acknowledged => ImshSemanticTone.warning,
      EmergencyRequestStatus.dispatched => ImshSemanticTone.info,
      EmergencyRequestStatus.closed => ImshSemanticTone.success,
      EmergencyRequestStatus.cancelled => ImshSemanticTone.neutral,
    };
    return ImshSemanticBadge(label: status.label, tone: tone);
  }
}

class _DetailBlock extends StatelessWidget {
  const _DetailBlock({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(AppDesignTokens.spacingXs),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDesignTokens.spacingXl),
      child: Column(
        children: [
          Icon(
            Icons.emergency_outlined,
            size: 48,
            color: context.colorScheme.error,
          ),
          const Gap(AppDesignTokens.spacingMd),
          Text(
            'No emergency requests yet',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(AppDesignTokens.spacingSm),
          Text(
            'Use Request help if you need ambulance or ED response.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDesignTokens.spacingXl),
      child: Column(
        children: [
          Text(message, textAlign: TextAlign.center),
          const Gap(AppDesignTokens.spacingMd),
          FilledButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _AuthenticatedAudioPlayer extends ConsumerStatefulWidget {
  const _AuthenticatedAudioPlayer({required this.requestId});

  final String requestId;

  @override
  ConsumerState<_AuthenticatedAudioPlayer> createState() =>
      _AuthenticatedAudioPlayerState();
}

class _AuthenticatedAudioPlayerState
    extends ConsumerState<_AuthenticatedAudioPlayer> {
  final _player = AudioPlayer();
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final path = ref
          .read(emergencyServiceProvider)
          .mediaPath(widget.requestId, 'voice');
      final base = ApiService().apiBaseUrl;
      final token = await TokenStorage.getAccessToken();
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse('$base$path'),
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      if (mounted) setState(() => _loading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = 'Could not load voice note';
        });
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImshSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Voice note',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(AppDesignTokens.spacingSm),
          if (_loading)
            const LinearProgressIndicator()
          else if (_error != null)
            Text(_error!)
          else
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return IconButton.filledTonal(
                  onPressed: () {
                    if (playing) {
                      _player.pause();
                    } else {
                      _player.play();
                    }
                  },
                  icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _AuthenticatedVideoPlayer extends ConsumerStatefulWidget {
  const _AuthenticatedVideoPlayer({required this.requestId});

  final String requestId;

  @override
  ConsumerState<_AuthenticatedVideoPlayer> createState() =>
      _AuthenticatedVideoPlayerState();
}

class _AuthenticatedVideoPlayerState
    extends ConsumerState<_AuthenticatedVideoPlayer> {
  VideoPlayerController? _controller;
  String? _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final path = ref
          .read(emergencyServiceProvider)
          .mediaPath(widget.requestId, 'video');
      final base = ApiService().apiBaseUrl;
      final token = await TokenStorage.getAccessToken();
      final controller = VideoPlayerController.networkUrl(
        Uri.parse('$base$path'),
        httpHeaders: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _controller = controller;
        _loading = false;
      });
    } catch (_) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = 'Could not load video';
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    return ImshSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Video',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(AppDesignTokens.spacingSm),
          if (_loading)
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_error != null || controller == null)
            Text(_error ?? 'Video unavailable')
          else ...[
            AspectRatio(
              aspectRatio: controller.value.aspectRatio == 0
                  ? 16 / 9
                  : controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                });
              },
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
