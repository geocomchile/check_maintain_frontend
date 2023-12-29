import 'package:check_maintain_frontend/domain/entities/device.dart';
import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/presentation/controllers/device_controller.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:check_maintain_frontend/presentation/widgets/charts/collimation_error_chart.dart';
import 'package:check_maintain_frontend/presentation/widgets/tables/dl_registers_table.dart';
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
           return (indexBottomNavigationBar == 0) ?  CollimationErrorChart(registers: registers) :  DlRegistersTable(registers: registers,);
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

class _CollimationErrorChart extends StatelessWidget {
  const _CollimationErrorChart({
    required this.registers,
  });

  final List<DlRegister> registers;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                 Text(
                  'Collimation Error',
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 6),
                    child: CollimationErrorChart(registers: registers)
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: colorScheme.onPrimaryContainer,
              ),
              onPressed: () {
      
              },
            )
          ],
        ),
      ),
    );
    

  }
}
