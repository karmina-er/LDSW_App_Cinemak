import 'package:flutter/material.dart';

void main() {
  runApp(const CinemakApp());
}

class CinemakApp extends StatelessWidget {
  const CinemakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/fondo.png',
              fit: BoxFit.cover,
            ),
          ),

          // Filtro oscuro
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          //  Contenido centrado (reutilizando tu idea de Column)
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.3),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [

                  //  Icono
                  Icon(
                    Icons.movie,
                    size: 80,
                    color: Colors.redAccent,
                  ),

                  SizedBox(height: 20),

                  //  Texto Bienvenida
                  Text(
                    'Bienvenida',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Nombre de la app
                  Text(
                    'Cinemak',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}