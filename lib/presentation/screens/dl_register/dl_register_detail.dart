import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:check_maintain_frontend/presentation/widgets/share/confirm_delete_dialog.dart';
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
  final dlRegisterController = Get.find<DLRegisterController>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dl Register ${dlRegister?.id}')),
        body: (dlRegister != null ) ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Collimation Error: ${dlRegister?.collimationError}'),
              Text('Error Date: ${dlRegister?.dateError}'),
              Text('Created: ${dlRegister?.created}'),
              Expanded(
                  child: Image.network(
                dlRegister?.image ?? '',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Error')),
              ),
              ElevatedButton.icon(onPressed: (){
                // dlRegisterController.deleteRegisterById(widget.idRegister);
                showDeleteConfirmation(context, () {
                  dlRegisterController.deleteRegisterById(widget.idRegister);
                });

              }, icon: const Icon(Icons.delete), label: const Text('Delete'))
            ],
          ),
        ): const Center(child: CircularProgressIndicator()));
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
