import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:check_maintain_frontend/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'HomePage';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: SideDrawer(scaffoldKey: scaffoldKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/new-file-register');
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // open drawer
              scaffoldKey.currentState?.openDrawer();

            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          title: const Text('Check Maintain'),
        ),
        body: const Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: DeviceCard(
                        deviceName: "Device 1",
                        serialNumber: '123344',
                        model: 'model'))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: DeviceCard(
                        deviceName: "Device 2",
                        serialNumber: '123344',
                        model: 'model'))
              ],
            ),
          ],
        ));
  }
}
