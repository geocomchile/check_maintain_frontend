import 'package:flutter/material.dart';



void showDeleteConfirmation(BuildContext context, void Function() onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Borrar'),
          content: const Text('¿Estás seguro de que quieres borrar este registro?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text('Borrar')
            ),
          ],
        );
      },
    );
  }