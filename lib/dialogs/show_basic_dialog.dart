import 'package:flutter/material.dart';

Future<bool?> showBasicDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("¿Estás seguro?"),
        content: const Text("Esta acción no se puede deshacer."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Cierra el diálogo devolviendo null
              Navigator.of(context).pop();
            },
            child: const Text("No"),
          ),
          FilledButton(
            onPressed: () {
              // Cierra el diálogo devolviendo true
              Navigator.of(context).pop(true);
            },
            child: const Text("Sí"),
          ),
        ],
      );
    },
  );
}
