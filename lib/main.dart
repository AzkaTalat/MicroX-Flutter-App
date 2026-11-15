
import 'package:flutter/material.dart';
import 'screens/careers/careers_screen.dart';

void main() {
  runApp(const MicroxApp());
}

class MicroxApp extends StatelessWidget {
  const MicroxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MicroX',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF111111),
        useMaterial3: true,
      ),
      home: const CareersScreen(),
    );
  }
}
