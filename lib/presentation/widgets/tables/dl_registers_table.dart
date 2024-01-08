import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DlRegisterTableInfo {
  final double collimationError;
  final DateTime dateError;
  final DateTime created;
  final String idRegister;

  DlRegisterTableInfo({
    required this.idRegister,
    required this.collimationError,
    required this.dateError,
    required this.created,
  });
}

class DlRegistersTable extends StatefulWidget {
  final List<DlRegister> registers;
  const DlRegistersTable({super.key, required this.registers});

  @override
  State<DlRegistersTable> createState() => _DlRegistersTableState();
}

class _DlRegistersTableState extends State<DlRegistersTable> {
  List<DlRegisterTableInfo> get _registers => widget.registers
      .map((register) => DlRegisterTableInfo(
            idRegister: register.id.toString(),
            collimationError: register.collimationError,
            dateError: register.dateError,
            created: register.created,
          ))
      .toList();

  late RegistersDataSource registersDataSource;

  @override
  void initState() {
    super.initState();
    registersDataSource = RegistersDataSource(registers: _registers);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (_registers.isEmpty) {
    return const Center(
      child: Text('No hay datos'),
    );
  } else {
    return SfDataGrid(
      onCellTap: (details) {
        final row = details.rowColumnIndex.rowIndex;
        final idRegister = _registers[row - 1].idRegister;
        GoRouter.of(context).push('/dl-register/$idRegister');
      },
      source: registersDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'collimationError',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  style: TextStyle(color: colorScheme.onPrimaryContainer),
                  'Error (DMS)',
                ))),
        GridColumn(
            columnName: 'dateError',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  'Fecha del error',
                  style: TextStyle(color: colorScheme.onPrimaryContainer),
                ))),
        GridColumn(
            columnName: 'created',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  style: TextStyle(color: colorScheme.onPrimaryContainer),
                  'Creado',
                  overflow: TextOverflow.ellipsis,
                ))),
      ],
    );
  }
}}

class RegistersDataSource extends DataGridSource {
  RegistersDataSource({required List<DlRegisterTableInfo> registers}) {
    _registers = registers
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<double>(
                  columnName: 'collimationError', value: e.collimationError),
              DataGridCell<DateTime>(
                  columnName: 'dateError', value: e.dateError),
              DataGridCell<DateTime>(columnName: 'created', value: e.created),
            ]))
        .toList();
  }

  List<DataGridRow> _registers = [];

  @override
  List<DataGridRow> get rows => _registers;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: (dataGridCell.columnName == 'dateError' ||
                  dataGridCell.columnName == 'created')
              ? Alignment.center
              : Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: (dataGridCell.columnName == 'dateError' ||
                  dataGridCell.columnName == 'created')
              ? Text(DateFormat('dd/MM/yy')
                  .format(dataGridCell.value ?? DateTime.now()))
              : Text(dataGridCell.value.toString()));
    }).toList());
  }
}
