import 'package:flutter/material.dart';

class Pemesanan extends StatefulWidget {
  const Pemesanan({Key? key}) : super(key: key);

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('pemesanan'),
                ]),
          )),
    ));
  }
}
