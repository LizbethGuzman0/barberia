import 'package:barberia/controlador/citas_controlador.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddCitasPage extends StatelessWidget {
  AddCitasPage({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  
  get horaController => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 40, 43, 88),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Agregar Cita',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 40, 43, 88),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: 'Hora de Cita',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                keyboardType: TextInputType.number,
              ),
      
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    String salida = CitasControlador ().agregarCitas(
                      idController.text,
                      nombreController.text,
                      double.parse(
                        precioController.text.isEmpty
                            ? '0'
                            : precioController.text,
                      ),
                    );
                    if (salida == 'Cita agregado') {
                      idController.clear();
                      nombreController.clear();
                      precioController.clear();
                    }
                  },
                  child: const Text('AGREGAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
