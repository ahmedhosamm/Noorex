import 'package:go_router/go_router.dart';
import 'package:noorex/Features/Authentication/Login/Login.dart';
import 'package:noorex/Features/Splash/View%20UI/Splash_Screen.dart';
import '../Features/Authentication/Create New Passward/Create _New_Passward.dart';
import '../Features/Authentication/Forgot Password/forgot_Password.dart';
import '../Features/Authentication/OTP Screen/OTP_Password.dart';
import '../Features/Authentication/SignUp/Signup.dart';
import '../Features/Authentication/Welcome Screen/Welcome_Screen.dart';

class AppRouter {
  // This is your routing table
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/WelcomeScreen', builder: (context, state) => const WelcomeScreen()),
      GoRoute(path: '/Signup', builder: (context, state) => const Signupscreen()),
      GoRoute(path: '/forgot_Password', builder: (context, state) => const forgot_Password()),
      GoRoute(
        path: '/OTP_Password',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return OTP_Password(email: extra['email'], isFromSignup: extra['isFromSignup']);
        },
      ),
      GoRoute(
        path: '/CreateNewPassword',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return Create_New_Password(email: extra['email'], isFromSignup: extra['isFromSignup']);
        },
      ),
    ],
  );
}
