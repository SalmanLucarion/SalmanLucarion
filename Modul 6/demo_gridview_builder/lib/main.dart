import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

// Class utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView.builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo GridView.builder'),
    );
  }
}

// StatefulWidget MyHomePage
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State dari MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  List dataBerita = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  // Fungsi untuk ambil data API
  Future _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jakpost.vercel.app/api/category/business/tech'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dataBerita = data['posts'];
        });
      } else {
        throw Exception('Gagal load data');
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.25,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: dataBerita.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                footer: SizedBox(
                  height: 65,
                  child: GridTileBar(
                    backgroundColor: Colors.black26.withAlpha(175),
                    title: Text(
                      dataBerita[index]['title'] ?? 'Tanpa judul',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // ✅ Pakai CachedNetworkImage
                child: CachedNetworkImage(
                  imageUrl: dataBerita[index]['image'] ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.broken_image,
                        size: 50, color: Colors.grey),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
