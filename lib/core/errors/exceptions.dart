// lib/core/errors/exceptions.dart

// WHY THIS FILE EXISTS:
// The http package only knows about network-level errors (SocketException, etc.)
// It has no idea what 401 or 404 MEANS for YOUR app.
// These custom exceptions translate HTTP status codes into
// meaningful, named error types that the rest of your app can understand.

// Base class — all exceptions extend this
// WHY: Lets you catch ALL app exceptions with one catch block if needed
abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

// 400 — client sent bad data
class BadRequestException extends AppException {
  const BadRequestException([
    super.message = 'Bad request — invalid data sent',
  ]);
}

// 401 — not authenticated
class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Session expired — please login again',
  ]);
}

// 403 — authenticated but not allowed
class ForbiddenException extends AppException {
  const ForbiddenException([
    super.message = 'You do not have permission for this action',
  ]);
}

// 404 — resource doesn't exist
class NotFoundException extends AppException {
  const NotFoundException([
    super.message = 'Resource not found',
  ]);
}

// 409 — duplicate/conflict
class ConflictException extends AppException {
  const ConflictException([
    super.message = 'Conflict with existing data',
  ]);
}

// 422 — business validation failed
class ValidationException extends AppException {
  const ValidationException([
    super.message = 'Validation failed',
  ]);
}

// 429 — too many requests
class RateLimitException extends AppException {
  const RateLimitException([
    super.message = 'Too many requests — please slow down',
  ]);
}

// 500/502/503 — server-side failure
class ServerException extends AppException {
  const ServerException([
    super.message = 'Server error — please try again later',
  ]);
}

// Network-level failure (no internet, DNS failure, timeout)
// NOT an HTTP status code — this happens BEFORE the request reaches the server
class NetworkException extends AppException {
  const NetworkException([
    super.message = 'No internet connection',
  ]);
}