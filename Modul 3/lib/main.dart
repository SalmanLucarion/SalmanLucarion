import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Modul 3',
      home: Scaffold(
        appBar: AppBar(title: const Text('Tugas Modul 3 - Cuaca')),
        body: const SafeArea(
          child: Center(
            child: CuacaUI(),
          ),
        ),
      ),
    );
  }
}

class CuacaUI extends StatelessWidget {
  const CuacaUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Nama kota
        const Text(
          'Malang',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // Suhu besar
        const Text(
          '25°',
          style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),

        // Tiga hari ke depan
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CuacaHarian(
              hari: 'Minggu',
              icon: Icons.sunny,
              suhu: '20°C',
            ),
            CuacaHarian(
              hari: 'Senin',
              icon: Icons.cloudy_snowing,
              suhu: '23°C',
            ),
            CuacaHarian(
              hari: 'Selasa',
              icon: Icons.cloud,
              suhu: '22°C',
            ),
          ],
        ),
      ],
    );
  }
}

class CuacaHarian extends StatelessWidget {
  final String hari;
  final IconData icon;
  final String suhu;

  const CuacaHarian({
    super.key,
    required this.hari,
    required this.icon,
    required this.suhu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hari, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 6),
        Icon(icon, size: 35),
        const SizedBox(height: 6),
        Text(suhu, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
