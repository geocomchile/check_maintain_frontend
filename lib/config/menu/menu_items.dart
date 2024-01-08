import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String url;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.url});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Home',
    subtitle: 'Inicio',
    icon: Icons.home_outlined,
    url: '/',
  ),
  MenuItem(
    title: 'Perfil',
    subtitle: 'Perifl de usuario',
    icon: Icons.person_outline,
    url: '/profile',
  ),
  MenuItem(
    title: 'Configuración',
    subtitle: 'Ajustes',
    icon: Icons.settings_outlined,
    url: '/settings',
  ),
  // MenuItem(
  //     title: 'Colors',
  //     subtitle: 'Example colors',
  //     icon: Icons.palette_outlined,
  //     url: '/colors'),
  // MenuItem(
  //     title: 'Example',
  //     subtitle: 'Example Chart',
  //     icon: Icons.graphic_eq,
  //     url: '/example'),
  MenuItem(
    title: 'Cerrar sesión',
    subtitle: 'Salir',
    icon: Icons.logout_outlined,
    url: '/logout',
  ),
];
