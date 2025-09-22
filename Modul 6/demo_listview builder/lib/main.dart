import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo ListView.builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataGame = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  // Fungsi ambil data API FreeToGame
  Future _ambilData() async {
    try {
      final response =
      await http.get(Uri.parse('https://www.freetogame.com/api/games'));

      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Simpan hanya 20 data pertama
          dataGame = data.take(20).toList();
        });
        print("Berhasil ambil data: ${dataGame.length} item");
      } else {
        print("Gagal load data. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: dataGame.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: dataGame.length,
        itemBuilder: (context, index) {
          return _listItem(
            dataGame[index]['thumbnail'] ??
                'https://via.placeholder.com/150',
            dataGame[index]['title'] ?? 'Tidak ada judul',
            dataGame[index]['genre'] ?? 'Tidak ada genre',
            dataGame[index]['release_date'] ?? 'Tidak ada tanggal',
          );
        },
      ),
    );
  }
}

// Fungsi tombol baca
Container _tombolBaca() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.orange, borderRadius: BorderRadius.circular(15)),
    child: const Text(
      'Baca Info',
      style: TextStyle(color: Colors.white),
    ),
  );
}

// Fungsi list item
Container _listItem(String url, String judul, String genre, String rilis) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        )
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            url,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(genre, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 2),
                      Text(rilis, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  _tombolBaca(),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
