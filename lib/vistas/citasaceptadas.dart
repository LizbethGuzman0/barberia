import 'package:barberia/controlador/citas_controlador.dart';
import 'package:barberia/vistas/InfoCitasbb.dart';
import 'package:barberia/vistas/addCitas.dart';
import 'package:flutter/material.dart';

class citasaceptadasPage extends StatefulWidget {
  const citasaceptadasPage({super.key});

  @override
  State<citasaceptadasPage> createState() => _citasaceptadasPageState();
}

class _citasaceptadasPageState extends State<citasaceptadasPage> {
  CitasControlador controlador = CitasControlador();
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
          'Citas',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 40, 43, 88),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: controlador.citas.isEmpty
          ? const Center(
              child: Text('No hay Citas'),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: controlador.citas.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 40, 43, 88),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(controlador.citas[index].nombre),
                      trailing: Text(
                        '\$${controlador.citas[index].precio}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoCitasPage(
                              citas: controlador.citas[index],
                            ),
                          ),
                        ).then(
                          (value) {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCitasPage(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        label: const Text('Agregar Citas'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
