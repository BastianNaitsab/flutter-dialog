// ignore: file_names
import 'package:flutter/material.dart';

void showInputDialog(BuildContext context) {
  // Crear controladores de texto para los dos campos
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();

  // Usar una clave global para el formulario y validarlo
  final _formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Ingresa tu información"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Campo de texto para el nombre con validación
              TextFormField(
                autofocus: true,
                controller: _nameController,
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(
                  hintText: "Escribe tu nombre",
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(fontSize: 12, color: Colors.red),
                ),
                // Validación del campo vacío para el nombre
                validator: (value) {
                  value = value?.trim() ?? "";
                  if (value.isEmpty) {
                    return 'El nombre no puede estar vacío';
                  }
                  if (value.length < 3) {
                    return "El nombre no puede ser tan corto";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
              ),

              const SizedBox(height: 16), // Espacio entre los campos

              // Campo de texto para el email con validación
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: const InputDecoration(
                  hintText: "Escribe tu correo electrónico",
                  labelText: "Correo electrónico",
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(fontSize: 12, color: Colors.red),
                ),
                // Validación del campo vacío y formato del email
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo electrónico no puede estar vacío';
                  }
                  // Validación simple de formato de email
                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Por favor, ingresa un correo válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // Botón de Cancelar
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text("Cancelar"),
          ),

          // Botón de Aceptar
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                String name = _nameController.text;
                String email = _emailController.text;
                Navigator.of(context).pop();
                // Aquí puedes hacer algo con el nombre y email ingresados
                showSnackbar(context, 'Hola, $name! Tu correo es $email');
              }
            },
            child: const Text("Aceptar"),
          ),
        ],
      );
    },
  );
}

// Mostrar un snackbar con el mensaje
void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}
