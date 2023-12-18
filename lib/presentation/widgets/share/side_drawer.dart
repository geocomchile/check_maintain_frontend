import 'package:check_maintain_frontend/config/menu/menu_items.dart';
import 'package:check_maintain_frontend/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class SideDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideDrawer({super.key, required this.scaffoldKey});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 35;

    return NavigationDrawer(
        onDestinationSelected: (value) {
          setState(() {
            if (appMenuItems[value].title == 'Cerrar sesión') {
              final AuthController controller = Get.find();
              controller.logout('');
              widget.scaffoldKey.currentState?.closeDrawer();
              return;
            }

            navDrawerIndex = value;
            final menuItem = appMenuItems[value];
            context.push(menuItem.url);
            widget.scaffoldKey.currentState?.closeDrawer();
          });
          navDrawerIndex = value;
        },
        selectedIndex: navDrawerIndex,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text('Main'),
          ),
          ...appMenuItems.sublist(0, 3).map((item) {
            return NavigationDrawerDestination(
                icon: Icon(item.icon), label: Text(item.title));
          }),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Others'),
          ),
        NavigationDrawerDestination(icon: Icon(appMenuItems.last.icon), label: Text(appMenuItems.last.title))
          
        ]);
  }
}