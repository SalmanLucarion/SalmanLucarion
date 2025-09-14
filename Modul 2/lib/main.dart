import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column - Step D',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row and Column - Step D'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakCustom(warna: Colors.blue, teks: "Satu"),
                  SizedBox(width: 20),
                  KotakCustom(warna: Colors.green, teks: "Dua"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakCustom(warna: Colors.orange, teks: "Tiga"),
                  SizedBox(width: 20),
                  KotakCustom(warna: Colors.purple, teks: "Empat"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakCustom extends StatelessWidget {
  final Color warna;
  final String teks;

  KotakCustom({required this.warna, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: warna,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          teks,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}