
import 'package:check_maintain_frontend/config/router/app_router_notifier.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:check_maintain_frontend/presentation/screens/device/device_screen.dart';
import 'package:check_maintain_frontend/presentation/screens/screens.dart';
import 'package:check_maintain_frontend/presentation/screens/settings/color_screen.dart';
import 'package:check_maintain_frontend/presentation/screens/settings/example_screen.dart';
import 'package:check_maintain_frontend/presentation/widgets/charts/example.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final authController = Get.find<AuthController>();
final appRouterNotifier = AppRouterNotifier(authController);

final appRouter = GoRouter(
  refreshListenable: appRouterNotifier,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const CheckAuthStatusScreen(),
    ),
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/new-file-register',
        name: NewFileRegisterScreen.name,
        builder: (context, state) => const NewFileRegisterScreen()),
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
    ),
    GoRoute(
      path: '/colors',
      name: ColorScreen.name,
      builder: (context, state) => ColorScreen(context: context),
    ),
    GoRoute(
      path: '/device/:idDevice',
      name: DeviceScreen.name,
      builder: (context, state) {
        final idDevice = state.pathParameters['idDevice'] ?? '';
        return DeviceScreen(idDevice: idDevice);
      },
    ),
    GoRoute(
        path: '/example',
        name: ExampleScreen.name,
        builder: (context, state) =>  const ExampleScreen())
  ],
  redirect: (context, state) {
    final isGoingTo = state.matchedLocation;
    final authStatus = authController.authStatus.value;

    if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) return null;

    if (authStatus == AuthStatus.notAuthenticated) {
      if (isGoingTo == '/login') return null;

      return '/login';
    }

    if (authStatus == AuthStatus.authenticated) {
      if (isGoingTo == '/login' || isGoingTo == '/splash') {
        return '/';
      }
    }

    return null;
  },
);
