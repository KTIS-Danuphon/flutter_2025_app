import 'package:flutter/material.dart';
// import 'package:myproject2025/screens/addform.dart';
// import 'package:myproject2025/screens/home.dart';
import 'package:myproject2025/screens/item.dart';

void main() {
  runApp(const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test AppTitle",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter AAAA"),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: const Item(),
      ),
    );
  }
}
