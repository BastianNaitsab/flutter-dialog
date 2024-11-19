import 'package:flutter/material.dart';

Future<dynamic> showBasicDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("¿Estás seguro?"),
        content: const Text("Esta acción no se puede deshacer."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text("No"),
          ),
          FilledButton(
            onPressed: () {
              // Aquí puedes ejecutar la acción de eliminar
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text("Sí"),
          ),
        ],
      );
    },
  );
}
