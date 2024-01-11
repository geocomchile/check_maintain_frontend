import 'package:flutter/material.dart';

class DLRegisterTableDetail extends StatelessWidget {
  final String error;
  final String errorDate;
  final String created;

  const DLRegisterTableDetail(
      {super.key,
      required this.error,
      required this.errorDate,
      required this.created});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colors.onSurface.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: Table(
          border: TableBorder.all(color: colors.onSurface.withOpacity(0.2)),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(), // Se adapta al contenido
            1: FlexColumnWidth(), // Se adapta al contenido
            2: FlexColumnWidth(), // Se adapta al contenido
          },
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error (DMS)',
                      style: TextStyle(
                          color: colors.onPrimaryContainer,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fecha del error',
                      style: TextStyle(
                          color: colors.onPrimaryContainer,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Creado',
                      style: TextStyle(
                          color: colors.onPrimaryContainer,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(error),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(errorDate),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(created),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
