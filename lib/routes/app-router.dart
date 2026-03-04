import 'package:go_router/go_router.dart';
import 'package:noorex/Features/Authentication/Login/Login.dart';
import 'package:noorex/Features/Splash/View%20UI/Splash_Screen.dart';
import '../Features/Authentication/Welcome Screen/Welcome_Screen.dart';

class AppRouter {
  // This is your routing table
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/WelcomeScreen', builder: (context, state) => const WelcomeScreen()),
    ],
  );
}
