import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/style/style.dart';
import 'package:pbma7/Akun.dart';
import 'package:pbma7/halaman_utama.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/pengaturan.dart';

class gantiakun extends StatefulWidget {
  const gantiakun({Key? key}) : super(key: key);

  @override
  State<gantiakun> createState() => _gantiakun();
}

class _gantiakun extends State<gantiakun> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  bool isHiddenPassword = true;

  void _tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF1EBBDD),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop('Back');
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop('Back');
                        },
                        child: const Text(
                          'Ganti Akun',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              margin: const EdgeInsets.only(top: 0, bottom: 0),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(90, 108, 234, 0.07),
                    blurRadius: 50,
                    spreadRadius: 0,
                    offset: Offset(12, 26))
              ]),
              child: TextFormField(
                controller: ctrlEmail,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'enter valid email'
                        : null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius1,
                    borderSide: BorderSide(color: Color(0xFF9E9E9E)),
                  ),
                  fillColor: Color(0xFF9E9E9E),
                  filled: true,
                  hintText: 'example@gmail.com',
                  labelText: 'Email Baru',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: color2,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              margin: const EdgeInsets.only(top: 0, bottom: 0),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(90, 108, 234, 0.07),
                    blurRadius: 50,
                    spreadRadius: 0,
                    offset: Offset(12, 26))
              ]),
              child: TextFormField(
                controller: ctrlEmail,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'enter valid email'
                        : null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Color(0xFF9E9E9E)),
                  ),
                  fillColor: Color(0xFF9E9E9E),
                  filled: true,
                  hintText: 'example@gmail.com',
                  labelText: 'Email lama',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: color2,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              margin: const EdgeInsets.only(top: 0, bottom: 0),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(90, 108, 234, 0.07),
                    blurRadius: 50,
                    spreadRadius: 0,
                    offset: Offset(12, 26))
              ]),
              child: TextFormField(
                obscureText: isHiddenPassword,
                controller: ctrlPassword,
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return 'enter min 6 char';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius1,
                    borderSide: BorderSide(color: Color(0xFF9E9E9E)),
                  ),
                  fillColor: Color(0xFF9E9E9E),
                  filled: true,
                  hintText: 'password123',
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: color2,
                  ),
                  suffixIcon: InkWell(
                    onTap: _tooglePasswordView,
                    child: Icon(
                      Icons.remove_red_eye,
                      color: color2,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 280, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: borderRadius1,
                  color: Color.fromRGBO(33, 150, 243, 1),
                  boxShadow: [boxshadow1]),
              child: TextButton(
                  child: const Text(
                    'Simpan',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    final isValidFrom = _formKey.currentState!.validate();
                    if (isValidFrom) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: ctrlEmail.text,
                              password: ctrlPassword.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pengaturan()));
                      }).onError((error, stackTrace) {
                        print("Error");
                        Fluttertoast.showToast(msg: 'Akun Tidak Ditemukan');
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
