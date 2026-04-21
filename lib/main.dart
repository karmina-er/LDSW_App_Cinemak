import 'package:flutter/material.dart';

void main() {
  runApp(const PerfilPeliculasSimple());
}

class PerfilPeliculasSimple extends StatelessWidget {
  const PerfilPeliculasSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Perfil de Películas'),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          // 1. CONTAINER: El cuadro gris principal (la tarjeta del perfil)
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],

            // 2. COLUMN: Acomoda la foto, el nombre y los datos de arriba a abajo
            child: Column(
              mainAxisSize: MainAxisSize.min, // Hace que no ocupe toda la pantalla, solo lo necesario
              children: [

                // 3. STACK: Apilamos un emoji de cine sobre un cuadro negro (simulando la foto)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.black87,
                    ),
                    const Text(
                      '🎬', // Emoji de cine flotando encima del cuadro
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Un espacio en blanco

                // 4. TEXT: El nombre del usuario y su biografía
                const Text(
                  'Usuario Tammy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Me encantan las películas de acción',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 20), // Un espacio en blanco

                // 5. ROW: Acomoda las estadísticas de izquierda a derecha
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Primer dato
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: const Text('Vistas: 150'),
                    ),
                    // Segundo dato
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: const Text('Reseñas: 42'),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}