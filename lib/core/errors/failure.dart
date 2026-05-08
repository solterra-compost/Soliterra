// ✅ core/errors/failures.dart

// A sealed class means every possible failure is known at compile time.
// The compiler will warn you if you don't handle a case.
sealed class Failure {
  final String message;
  const Failure(this.message);
}

// Network-level failures
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

// Firebase/server failures  
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

// Authentication failures
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

// Permission failures (Firestore rules blocked the operation)
class PermissionFailure extends Failure {
  const PermissionFailure([super.message = 'Permission denied']);
}

// Cache failures
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local cache error']);
}