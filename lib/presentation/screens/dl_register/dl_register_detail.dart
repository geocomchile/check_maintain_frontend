import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:check_maintain_frontend/presentation/controllers/dl_register_controller.dart';
import 'package:check_maintain_frontend/presentation/widgets/share/confirm_delete_dialog.dart';
import 'package:check_maintain_frontend/presentation/widgets/tables/dl_register_table_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
  String created = '';
  String errorDate = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (dlRegister != null) {
      created = DateFormat('dd-MM-yyyy').format(dlRegister!.created);
      errorDate = DateFormat('dd-MM-yyyy').format(dlRegister!.dateError);
    }

    return Scaffold(
        appBar: AppBar(title: Text('Dl Register ${dlRegister?.id}')),
        body: (dlRegister != null)
            ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Image(dlRegister: dlRegister),
              
                  const SizedBox(height: 30,),        
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DLRegisterTableDetail(
                      error: dlRegister!.collimationError.toString(),
                      errorDate: errorDate,
                      created: created,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(Icons.arrow_back_ios_rounded),
                              label: const Text('Atras')),
                          const Spacer(),
                          ElevatedButton.icon(
                              onPressed: () {
                                // dlRegisterController.deleteRegisterById(widget.idRegister);
                                showDeleteConfirmation(context, () {
                                  dlRegisterController
                                      .deleteRegisterById(widget.idRegister);
                                });
                              },
                              icon: const Icon(Icons.delete),
                              label: const Text('Borrar')),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
            : const Center(child: CircularProgressIndicator()));
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

class _Image extends StatelessWidget {
  const _Image({
    required this.dlRegister,
  });

  final DlRegister? dlRegister;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
    
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            height: screenSize.height * 0.5,
            fit: BoxFit.cover,
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
      ),
    );
  }
}
