import 'package:flutter/material.dart';
import 'package:pbma7/halaman_daftar.dart';
import 'package:pbma7/halaman_login.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 75, 203, 220),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 150),
            Container(
                child: Image.asset(
              'assets/images/RCM_Logo.png',
              height: 150,
            )),
            SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return Login();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Color.fromARGB(255, 30, 187, 221)),
                  child: Text(
                    "LOG IN",
                    style: TextStyle(fontSize: 30, fontFamily: "Poppins"),
                  )),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return register();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Color.fromARGB(255, 255, 255, 255)),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Poppins",
                        color: Color.fromARGB(255, 30, 187, 221)),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
