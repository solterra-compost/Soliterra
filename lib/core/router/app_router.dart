import 'package:go_router/go_router.dart';
import 'package:solterra/features/landing/presentation/pages/landing_page.dart';

class AppRouter {
  static GoRouter router() => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => LandingPage()),
    ],
  );
}