import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pbma7/halaman_utama.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: halamanutama(),
    );
  }
}
