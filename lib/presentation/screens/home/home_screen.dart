import 'package:check_maintain_frontend/presentation/controllers/device_controller.dart';
import 'package:flutter/material.dart';
import 'package:check_maintain_frontend/presentation/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'HomePage';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceController = Get.find<DeviceController>();
    deviceController.getDevices();

    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: SideDrawer(scaffoldKey: scaffoldKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/new-file-register');
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
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.search),
          //     onPressed: () {},
          //   ),
          // ],
          title: const Text('Check Maintain'),
        ),
        body: 
        
        Obx(() {
          if (deviceController.devices.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: deviceController.devices.length,
              itemBuilder: (context, index) {
                final device = deviceController.devices[index];
                return GestureDetector(
                  onTap: () {
                    context.push('/device/${device.id}');
                  }
                  ,
                  child: DeviceCard(deviceName: device.modelName, serialNumber: device.serialNumber, model: device.modelName,));
              },
            );
          }
        }));
  }
}
