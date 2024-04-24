import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:management_app/screens/add_item_screen.dart'; // Import your AddItemScreen file

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Item Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddItemScreen(), // Update to use AddItemScreen
    );
  }
}