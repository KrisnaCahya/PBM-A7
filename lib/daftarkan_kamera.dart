import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pbma7/navbar.dart';
import 'package:image_picker/image_picker.dart';

class DaftarkanKamera extends StatefulWidget {
  const DaftarkanKamera({Key? key}) : super(key: key);

  @override
  State<DaftarkanKamera> createState() => _DaftarkanKameraState();
}

class _DaftarkanKameraState extends State<DaftarkanKamera> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController ctrlNamaCam = TextEditingController();
  TextEditingController ctrlHarga = TextEditingController();
  TextEditingController ctrlDesk = TextEditingController();

  File? imageFile;
  String? imageUrl;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.imageFile = imageTemp);
  }

  String? image;
  String? nama;
  String? alamat;

  void _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          image = snapshot.data()!['userImage'];
          nama = snapshot.data()!['NamaLengkap'];
          alamat = snapshot.data()!['Alamat'];
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
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 30, 8, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop('Back');
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop('Back');
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Daftarkan Kamera',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((Builder) => bottomSheet()));
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundImage: imageFile == null
                                    ? const AssetImage(
                                        "assets/images/addimg.png")
                                    : Image.file(imageFile!).image),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text('Foto Kamera',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text('Model Kamera',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: ctrlNamaCam,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0xFF9E9E9E),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text('Harga Kamera/Hari',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextFormField(
                        controller: ctrlHarga,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong';
                          }
                          return null;
                        },
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0xFF9E9E9E),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text('Deskripsi',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: ctrlDesk,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ElevatedButton(
                          onPressed: () async {
                            final isValidFrom =
                                _formKey.currentState!.validate();
                            if (isValidFrom) {
                              final ref = FirebaseStorage.instance
                                  .ref()
                                  .child('cameraImages')
                                  .child(DateTime.now().toString() + '.jpg');
                              await ref.putFile(imageFile!);
                              imageUrl = await ref.getDownloadURL();
                              FirebaseFirestore.instance
                                  .collection('camera')
                                  .doc(DateTime.now().toString())
                                  .set({
                                'FotoKamera': imageUrl,
                                'ModelKamera': ctrlNamaCam.text,
                                'Harga': ctrlHarga.text,
                                'Deskripsi': ctrlDesk.text,
                                'ProfilPict': image,
                                'NamaToko': nama,
                                'Alamat': alamat,
                              });
                              print("Created New Account");
                              Fluttertoast.showToast(
                                  msg: 'Kamera Berhasil Ditambahkan');
                            }
                          },
                          child: Text(
                            'Konfirmasi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1EBBDD),
                          ))),
                ),
              ],
            ),
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
