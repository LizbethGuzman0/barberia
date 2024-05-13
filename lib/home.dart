import 'package:barberia/citasespera.dart';
import 'package:barberia/vistas/citasaceptadas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bar2.jpg'), 
            fit: BoxFit.fill, 
             ),
        
      ),
    

        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Align(
              alignment: Alignment.centerLeft,
            
              child: Text(
                
                '      LA BARBER',
                
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
        
            color: Color.fromARGB(255, 0, 0, 0),

                  
                ),
                
              ),
                 ),




                

                const SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const citasaceptadasPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Citas aceptadas ',
                            style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const citasesperaPage(),
                              ),
                            );
      
                          },
                          child: const Text(
                            'Catalogo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
               

              ],
            ),
          ),
        );
      
  }
}



