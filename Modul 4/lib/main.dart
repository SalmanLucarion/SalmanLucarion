import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control Bar Musik',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pemutar Musik'),
        ),
        body: Center(
          child: Text(
            'Konten Aplikasi',
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,
          child: Row(
            children: [
              Expanded(
                child: Icon(Icons.shuffle, color: Colors.white, size: 30),
              ),
              Expanded(
                child: Icon(Icons.skip_previous, color: Colors.white, size: 30),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 45),
              ),
              Expanded(
                child: Icon(Icons.skip_next, color: Colors.white, size: 30),
              ),
              Expanded(
                child: Icon(Icons.repeat, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
