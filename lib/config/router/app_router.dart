import 'package:check_maintain_frontend/ui/pages/home_page.dart';
import 'package:check_maintain_frontend/ui/pages/logout_page.dart';
import 'package:check_maintain_frontend/ui/pages/new_file_register_page.dart';
import 'package:check_maintain_frontend/ui/pages/profile_page.dart';
import 'package:check_maintain_frontend/ui/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/new-file-register',
        name: NewFileRegisterPage.name,
        builder: (context, state) => NewFileRegisterPage()),
    GoRoute(
        path: '/profile',
        name: ProfilePage.name,
        builder: (context, state) => const ProfilePage()),
    GoRoute(
        path: '/settings',
        name: SettingsPage.name,
        builder: (context, state) => const SettingsPage()),
    GoRoute(
      path: '/logout',
      name: LogoutPage.name,
      builder: (context, state) => const LogoutPage(),
    )
  ],
);
