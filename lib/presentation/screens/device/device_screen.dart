import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/presentation/controllers/device_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:check_maintain_frontend/presentation/widgets/charts/collimation_error_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceScreen extends StatefulWidget {
  static const String name = 'device-screen';
  const DeviceScreen({super.key, required this.idDevice});

  final String idDevice;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {

  
  int indexBottomNavigationBar = 0;
  bool isLoading = true;
  Device? device;
  List<DlRegister> registers = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorScheme.onPrimaryContainer,
        onTap: (index) => setState(() {
          indexBottomNavigationBar = index;
        }),
        currentIndex: indexBottomNavigationBar,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.area_chart_outlined),
            label: 'Grafico',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_outlined),
            label: 'Registros',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Device ${device?.serialNumber ?? ''}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (){
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.onPrimaryContainer,),
            );
          } else {
           return (indexBottomNavigationBar == 0) ?  CollimationErrorChart(registers: registers) : const Text('Lista');
          }
  }(),
    ));
  }

  Future<void> _loadData() async {
    final dlRegisterController = Get.find<DLRegisterController>();
    final DeviceController deviceController = Get.find<DeviceController>();
    // get device data
    var device = await deviceController.getDevice(widget.idDevice);
    // get device registers
    var registers = await  dlRegisterController.getRegistersByDeviceId(widget.idDevice);

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      isLoading = false;
      this.registers = registers;
      this.device = device;
    });
  }
}
