import 'package:check_maintain_frontend/ui/widgets/device_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const name = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceCard(
      deviceName: 'Dispositivo 1',
      serialNumber: '123456789',
      model: 'Modelo 1',);
  }
}