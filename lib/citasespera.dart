import 'package:flutter/material.dart';

class citasesperaPage extends StatelessWidget {
  const citasesperaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 39, 50, 112),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Citas en Espera',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 18, 33, 92),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
    );
  }
}