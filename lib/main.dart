import 'package:barberia/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();

  await Hive.openBox('citas');

  await Hive.openBox('citas pendientes');

  await Hive.openBox('Info de citas');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Schyler',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 22, 16, 51)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
