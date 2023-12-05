import 'package:check_maintain_frontend/ui/widgets/devices/device_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const name = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push( '/new-file-register');

          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
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
