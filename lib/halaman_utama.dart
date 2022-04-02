import 'package:flutter/material.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            Container(
                alignment: Alignment.center,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                alignment: Alignment.center,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
