import 'package:flutter/material.dart';

class Pemesanan extends StatelessWidget {
  const Pemesanan({Key? key}) : super(key: key);
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
