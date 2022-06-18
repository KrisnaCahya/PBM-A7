import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pbma7/data_pribadi.dart';
import 'package:pbma7/pengaturan.dart';
import 'package:pbma7/style/style.dart';

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  String? image = '';
  String? nama = '';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          image = snapshot.data()!['userImage'];
          nama = snapshot.data()!['NamaLengkap'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        padding: EdgeInsets.all(10),
        height: 100,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        decoration: BoxDecoration(
          color: Color(0xFF1EBBDD),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Color(0xFF9E9E9E),
              offset: Offset(1, 1),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: CircleAvatar(
                  radius: 30, backgroundImage: NetworkImage(image!)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Text(
                nama!,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: ListTile(
          title: const Text("Data Pribadi",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          tileColor: color1,
          trailing: IconButton(
              highlightColor: Colors.grey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return DataPribadi();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white)),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: ListTile(
          title: const Text("Pengaturan",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          tileColor: color1,
          trailing: IconButton(
              highlightColor: Colors.grey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return Pengaturan();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white)),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: ListTile(
          title: const Text("Persyaratan Peminjaman Kamera",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          tileColor: color1,
          trailing: IconButton(
              highlightColor: Colors.grey,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white)),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: ListTile(
          title: const Text("Toko Saya",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          tileColor: color1,
          trailing: IconButton(
              highlightColor: Colors.grey,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white)),
        ),
      )
    ]));
  }
}
