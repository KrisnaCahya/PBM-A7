import 'package:flutter/material.dart';
import 'package:pbma7/halaman_utama.dart';
import 'package:pbma7/pesancam.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PesanCam(),
    );
  }
}
