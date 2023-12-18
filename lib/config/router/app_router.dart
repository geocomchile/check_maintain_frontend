import 'package:check_maintain_frontend/config/router/app_router_notifier.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:check_maintain_frontend/presentation/screens/screens.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final authController = Get.find<AuthController>();
final appRouterNotifier = AppRouterNotifier(authController);

final appRouter = GoRouter(
    refreshListenable: appRouterNotifier,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
          path: '/new-file-register',
          name: NewFileRegisterScreen.name,
          builder: (context, state) => NewFileRegisterScreen()),
      GoRoute(
          path: '/profile',
          name: ProfileScreen.name,
          builder: (context, state) => const ProfileScreen()),
      GoRoute(
          path: '/settings',
          name: SettingsScreen.name,
          builder: (context, state) => const SettingsScreen()),
      GoRoute(
          path: '/logout',
          name: LogoutScreen.name,
          builder: (context, state) => const LogoutScreen()),
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      )
    ],
    redirect: (context, state) {
      return null;
    });
