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

class gantipassword extends StatefulWidget {
  const gantipassword({Key? key}) : super(key: key);

  @override
  State<gantipassword> createState() => _gantipassword();
}

class _gantipassword extends State<gantipassword> {
  final GlobalKey<FormState> _gantipasswordkey = GlobalKey<FormState>();

  final ctrlPassword = TextEditingController();
  final ctrlPassword2 = TextEditingController();
  bool isHiddenPassword = true;
  bool isHiddenPassword2 = true;

  var newPassword = " ";

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    ctrlPassword2.dispose();
    super.dispose();
  }

  changepassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => halamanutama()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(' Your Password has been Changed...'),
      ));
    } catch (error) {}
  }

  void _tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _gantipasswordkey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
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
                          'Ganti Password',
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
              padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 0),
              margin: const EdgeInsets.only(top: 50, bottom: 0),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(90, 108, 234, 0.07),
                    blurRadius: 50,
                    spreadRadius: 0,
                    offset: Offset(12, 26))
              ]),
              child: TextFormField(
                obscureText: isHiddenPassword,
                controller: ctrlPassword2,
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
                  labelText: 'Kata Sandi Baru',
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
              margin: const EdgeInsets.only(left: 80, top: 50, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 70),
              decoration: BoxDecoration(
                  borderRadius: borderRadius1,
                  color: Color.fromRGBO(33, 150, 243, 1),
                  boxShadow: [boxshadow1]),
              child: TextButton(
                  child: const Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_gantipasswordkey.currentState!.validate()) {
                      setState(() {
                        newPassword = ctrlPassword2.text;
                      });
                      changepassword();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
