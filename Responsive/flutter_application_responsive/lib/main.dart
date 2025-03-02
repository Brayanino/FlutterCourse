import 'package:flutter/material.dart';
import 'package:flutter_application_responsive/ui/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive App',
      home: HomePage(),
    );
  }
}
