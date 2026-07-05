import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_design_tokens.dart';
import '../../../models/medication_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/medications_provider.dart';
import 'next_dose_card.dart';

class NextDoseCarousel extends ConsumerStatefulWidget {
  const NextDoseCarousel({
    super.key,
    required this.doses,
  });

  final List<MedicationDoseSummary> doses;

  @override
  ConsumerState<NextDoseCarousel> createState() => _NextDoseCarouselState();
}

class _NextDoseCarouselState extends ConsumerState<NextDoseCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doses.isEmpty) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    final markNotifier = ref.watch(markDoseTakenProvider.notifier);

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.doses.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final dose = widget.doses[index];
              final isMarking = ref.watch(markDoseTakenProvider).maybeWhen(
                    data: (inFlight) => inFlight.contains(dose.id),
                    orElse: () => false,
                  );

              return NextDoseCard(
                dose: dose,
                isMarking: isMarking,
                onMarkTaken: () async {
                  try {
                    await markNotifier.markTaken(dose.id);
                  } catch (error) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(authFlowErrorMessage(error)),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        if (widget.doses.length > 1) ...[
          const Gap(AppDesignTokens.spacingSm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.doses.length, (index) {
              final isActive = index == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: isActive ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}
