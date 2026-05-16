import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart'; // 1. Importa el paquete básico de Firebase

void main() async {
  // 2. Asegura que los componentes nativos de Android/Flutter estén listos
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Inicializa Firebase de forma nativa usando el archivo google-services.json
  await Firebase.initializeApp();

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

          // Contenido centrado
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.3),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Icono
                  const Icon(
                    Icons.movie,
                    size: 80,
                    color: Colors.redAccent,
                  ),

                  const SizedBox(height: 20),

                  // Texto Bienvenida
                  const Text(
                    'Bienvenida',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Nombre de la app
                  const Text(
                    'Cinemak',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // BOTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),

                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarvelScreen(),
                        ),
                      );

                    },

                    child: const Text(
                      'Ver peliculas',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
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

class MarvelScreen extends StatefulWidget {
  const MarvelScreen({super.key});

  @override
  State<MarvelScreen> createState() => _MarvelScreenState();
}

class _MarvelScreenState extends State<MarvelScreen> {

  List peliculas = [];

  // PON AQUI TU API KEY REAL
  final String apiKey = 'c4dc969c988d55f28141c6048f74010a';

  @override
  void initState() {
    super.initState();
    obtenerPeliculas();
  }

  Future<void> obtenerPeliculas() async {

    String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=es-MX&page=1';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      setState(() {

        peliculas = data['results'];

      });

    } else {

      print('Error al cargar peliculas');

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Películas'),
      ),

      body: peliculas.isEmpty

          ? const Center(
        child: CircularProgressIndicator(),
      )

          : ListView.builder(

        itemCount: peliculas.length,

        itemBuilder: (context, index) {

          final pelicula = peliculas[index];

          String poster = pelicula['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w500${pelicula['poster_path']}'
              : '';

          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.all(10),

            child: ListTile(

              leading: poster.isNotEmpty
                  ? Image.network(
                poster,
                width: 50,
                fit: BoxFit.cover,
              )
                  : const Icon(
                Icons.movie,
                color: Colors.white,
              ),

              title: Text(
                pelicula['title'],
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),

              subtitle: Text(
                pelicula['overview'],

                maxLines: 2,

                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}