import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DlRegisterDetail extends StatefulWidget {
  static const String name = 'dl-register-detail';

  final String idRegister;

  const DlRegisterDetail({Key? key, required this.idRegister})
      : super(key: key);

  @override
  State<DlRegisterDetail> createState() => _DlRegisterDetailState();
}

class _DlRegisterDetailState extends State<DlRegisterDetail> {
  DlRegister? dlRegister;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dl Register ${dlRegister?.id}')),
    );
  }

  Future<void> _loadData() async {
    final dlRegisterController = Get.find<DLRegisterController>();
    final dlRegister =
        await dlRegisterController.getRegisterById(widget.idRegister);
    setState(() {
      this.dlRegister = dlRegister;
    });
  }
}
