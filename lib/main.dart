import 'package:flutter/material.dart';
import 'package:flutter_dialog/dialogs/show_basic_dialog.dart';
import 'package:flutter_dialog/dialogs/show_input_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo ShowDialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              label: const Text("Show Dialog Basic"),
              onPressed: () async {
                final result = await showBasicDialog(context);
                debugPrint("resultado showBasicDialog: $result");
              },
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                final result = await showInputDialog(context);
                debugPrint("resultado showInputDialog: $result");

                if (result != null) {
                  String name = result["name"]!;
                  String email = result["email"]!;
                  debugPrint("resultado name: $name");
                  debugPrint("resultado email: $email");
                }
              },
              label: const Text("Show Dialog Input"),
            ),
          ],
        ),
      ),
    );
  }
}
