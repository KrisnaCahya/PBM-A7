import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pbma7/style/style.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? image = '';
  String? nama = '';
  String? nohp = '';
  String? alamat = '';
  File? imageFile;
  String? imageUrl;
  TextEditingController ctrlNama = TextEditingController();
  TextEditingController ctrlNoTelp = TextEditingController();
  TextEditingController ctrlAlamat = TextEditingController();

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
          nohp = snapshot.data()!['NoTelepon'];
          alamat = snapshot.data()!['Alamat'];
        });
      }
    });
  }

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.imageFile = imageTemp);
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  updateProfilInDataCamera() async {
    await FirebaseFirestore.instance
        .collection('camera')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String userProfilPictInCamera = snapshot.docs[index]['ProfilPict'];
        if (userProfilPictInCamera != imageUrl) {
          FirebaseFirestore.instance
              .collection('camera')
              .doc(snapshot.docs[index].id)
              .update({'ProfilPict': imageUrl});
        }
      }
    });
  }
  updateNameInDataCamera() async {
    await FirebaseFirestore.instance
        .collection('camera')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String userNameInCamera = snapshot.docs[index]['NamaToko'];
        if (userNameInCamera != ctrlNama.text) {
          FirebaseFirestore.instance
              .collection('camera')
              .doc(snapshot.docs[index].id)
              .update({'NamaToko': ctrlNama.text});
        }
      }
    });
  }
  updateAlamatInDataCamera() async {
    await FirebaseFirestore.instance
        .collection('camera')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (int index = 0; index < snapshot.docs.length; index++) {
        String userAddrInCamera = snapshot.docs[index]['Alamat'];
        if (userAddrInCamera != ctrlAlamat.text) {
          FirebaseFirestore.instance
              .collection('camera')
              .doc(snapshot.docs[index].id)
              .update({'Alamat': ctrlAlamat.text});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Container(
                width: 200,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF1EBBDD),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
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
                          'Edit Profil',
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
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((Builder) => bottomSheet()));
                              },
                              child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: imageFile == null
                                      ? NetworkImage(image!)
                                      : Image.file(imageFile!).image)),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text('Foto Profil',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ]),
                      ),
                    ])),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
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
                  fillColor: Colors.white,
                  filled: true,
                  hintText: nama,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
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
                  fillColor: Colors.white,
                  filled: true,
                  hintText: nohp,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
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
                  fillColor: Colors.white,
                  filled: true,
                  labelText: alamat,
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff1EBBDD), // background/ foreground
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
                          final User? user = _auth.currentUser;
                          final _uid = user!.uid;
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(_uid)
                              .update({
                            'NamaLengkap': ctrlNama.text,
                            'NoTelepon': ctrlNoTelp.text,
                            'Alamat': ctrlAlamat.text,
                            'userImage': imageUrl,
                          });
                          updateProfilInDataCamera();
                          updateAlamatInDataCamera();
                          updateNameInDataCamera();
                          print("Berhasil memperbarui akun");
                          Fluttertoast.showToast(
                              msg: 'Berhasil Memperbarui Data');
                        }
                      },
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
          ],
        ),
      ),
    ));
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
