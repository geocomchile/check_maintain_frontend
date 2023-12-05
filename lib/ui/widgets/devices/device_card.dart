import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final String serialNumber;
  final String model;

  const DeviceCard(
      {super.key,
      required this.deviceName,
      required this.serialNumber,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nombre del Dispositivo: $deviceName',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Número de Serie: $serialNumber'),
            const SizedBox(height: 5),
            Text('Modelo: $model'),
          ],
        ),
      ),
    );
  }
}
