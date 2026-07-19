/// Sealed base class for all application exceptions.
sealed class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

/// No internet / connection refused.
final class NetworkException extends AppException {
  const NetworkException([
    super.message =
        "We couldn't reach the hospital server. Check your connection and try again.",
  ]);
}

/// Request timed out.
final class TimeoutException extends AppException {
  const TimeoutException([
    super.message = 'Request timed out. Please try again.',
  ]);
}

/// Any 4xx / 5xx HTTP response.
final class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

/// 409 – concurrency / conflict.
final class ConflictException extends AppException {
  const ConflictException([
    super.message = 'The resource was modified by another process.',
  ]) : super(statusCode: 409);
}

/// 401 – token missing, expired, or device revoked.
final class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Session expired. Please log in again.',
  ]) : code = null,
       super(statusCode: 401);

  const UnauthorizedException.withCode(
    super.message, {
    required this.code,
  }) : super(statusCode: 401);

  final String? code;

  bool get isDeviceRevoked => code == 'DEVICE_REVOKED';
}

/// 403 – authenticated but lacks permission / device pending.
final class ForbiddenException extends AppException {
  const ForbiddenException([
    super.message = 'You do not have permission to perform this action.',
  ]) : code = null,
       super(statusCode: 403);

  const ForbiddenException.withCode(
    super.message, {
    required this.code,
  }) : super(statusCode: 403);

  final String? code;

  bool get isDevicePendingApproval => code == 'DEVICE_PENDING_APPROVAL';
}

/// 404 – resource not found.
final class NotFoundException extends AppException {
  const NotFoundException([
    super.message = 'The requested resource was not found.',
  ]) : super(statusCode: 404);
}

/// 422 / 400 – validation errors from the server.
final class ValidationException extends AppException {
  const ValidationException(
    super.message, {
    this.errors,
    super.statusCode = 422,
  });

  /// Map of field → list of error strings (e.g. from NestJS class-validator).
  final Map<String, List<String>>? errors;
}

/// Unexpected / unparseable response.
final class UnknownException extends AppException {
  const UnknownException([super.message = 'An unexpected error occurred.']);
}
