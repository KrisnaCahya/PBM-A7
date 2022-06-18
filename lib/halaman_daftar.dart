import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/style/style.dart';
import 'package:flutter/material.dart';
import 'package:pbma7/halaman_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  TextEditingController ctrlNama = TextEditingController();
  TextEditingController ctrlNoTelp = TextEditingController();
  TextEditingController ctrlAlamat = TextEditingController();
  bool isHiddenPassword = true;

  File? imageFile;
  String? imageUrl;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.imageFile = imageTemp);
  }

  void _tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color1,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'REGISTER',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text('Sign Up For Free',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((Builder) => bottomSheet()));
                },
                child: CircleAvatar(
                    radius: 35,
                    backgroundImage: imageFile == null
                        ? const AssetImage("assets/images/addimg.png")
                        : Image.file(imageFile!).image),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: Text('Foto Profil',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: ctrlEmail,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'enter valid email'
                          : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'example@krisstudio.com',
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
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
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'password123',
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: color1,
                    ),
                    suffixIcon: InkWell(
                      onTap: _tooglePasswordView,
                      child: Icon(
                        Icons.remove_red_eye,
                        color: color1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: ctrlNama,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    if (value != null && value.length < 6) {
                      return 'Minimal 6 huruf';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(
                      Icons.person,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: ctrlNoTelp,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No Telepon tidak boleh kosong';
                    }
                    if (value != null && value.length < 6) {
                      return 'Minimal 6 huruf';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'No Telepon',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(90, 108, 234, 0.07),
                      blurRadius: 50,
                      spreadRadius: 0,
                      offset: Offset(12, 26),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: ctrlAlamat,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    if (value != null && value.length < 6) {
                      return 'Minimal 6 huruf';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius1,
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Alamat',
                    prefixIcon: Icon(
                      Icons.home,
                      color: color1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                //width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: borderRadius1,
                    color: Color.fromRGBO(33, 150, 243, 1),
                    boxShadow: [boxshadow1]),
                child: TextButton(
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final isValidFrom = _formKey.currentState!.validate();
                    if (isValidFrom) {
                      final ref = FirebaseStorage.instance
                          .ref()
                          .child('userImages')
                          .child(DateTime.now().toString() + '.jpg');
                      await ref.putFile(imageFile!);
                      imageUrl = await ref.getDownloadURL();
                      await _auth.createUserWithEmailAndPassword(
                          email: ctrlEmail.text, password: ctrlPassword.text);
                      final User? user = _auth.currentUser;
                      final _uid = user!.uid;
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(_uid)
                          .set({
                            'id':_uid,
                            'NamaLengkap':ctrlNama.text,
                            'NoTelepon': ctrlNoTelp.text,
                            'Alamat':ctrlAlamat.text,
                            'userImage': imageUrl,
                          });
                          Navigator.canPop(context)? Navigator.pop(context):null;
                           // FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //         email: ctrlEmail.text,
                      //         password: ctrlPassword.text)
                      //     .then((value) {
                        // print("Created New Account");
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Navbar()));
                      // }).onError((error, stackTrace) {
                      //   print("Error");
                      // });
                    }
                  },
                ),
              ),
              TextButton(
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
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            const Text(
              "Upload Gambar :",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.camera_alt_sharp),
                  onPressed: () => pickImage(ImageSource.camera),
                  style: TextButton.styleFrom(primary: Colors.black),
                  label: Text("Kamera"),
                ),
                TextButton.icon(
                  icon: Icon(Icons.broken_image_outlined),
                  onPressed: () => pickImage(ImageSource.gallery),
                  style: TextButton.styleFrom(primary: Colors.black),
                  label: Text("Galeri"),
                )
              ],
            )
          ],
        ));
  }
}
