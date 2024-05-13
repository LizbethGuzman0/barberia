import 'package:barberia/modelo/Citas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barberia/controlador/citas_controlador.dart';

class InfoCitasPage extends StatefulWidget {
  final Citas citas;
  const InfoCitasPage ({super.key, required this.citas});

  @override
  State<InfoCitasPage> createState() => _EditCitasPageState();
}

class _EditCitasPageState extends State<InfoCitasPage> {
  final CitasControlador controlador = CitasControlador();

  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Citas p = widget.citas;
    idController.text = p.id.toString();
    nombreController.text = p.nombre;
    precioController.text = p.precio.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFFebacab),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Editar Cita',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 24, 30, 82),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: 'Hora de Cita',
                  border: OutlineInputBorder(),
                ),
                // enabled: false,
                readOnly: true,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Cliente',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(
                  labelText: 'Hora',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                keyboardType: TextInputType.number,
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          controlador.eliminarCitas(widget.citas.id);
                          Navigator.pop(context);
                        },
                        child: const Text('Eliminar'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          controlador.editarCitas(
                            widget.citas.id,
                            nombreController.text,
                            double.parse(
                              precioController.text.isEmpty
                                  ? '0'
                                  : precioController.text,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Editar'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
