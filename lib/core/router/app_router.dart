import 'package:go_router/go_router.dart';
import 'package:solterra/features/landing/presentation/pages/landing_page.dart';

class AppRouter {
  static GoRouter router() => GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(path: '/dashboard', builder: (context, state) => LandingPage()),
    ],
  );
}
