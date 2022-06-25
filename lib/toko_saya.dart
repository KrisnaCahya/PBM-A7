import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pbma7/order.dart';
import 'package:pbma7/editdatakamera.dart';

class TokoSaya extends StatefulWidget {
  const TokoSaya({Key? key}) : super(key: key);

  @override
  State<TokoSaya> createState() => _TokoSayaState();
}

class _TokoSayaState extends State<TokoSaya> {
  String? Alamat = '';
  String? Deskripsi = '';
  String? FotoKamera = '';
  String? Harga = '';
  String? ModelKamera = '';
  String? NamaToko = '';
  String? ProfilPict = '';

  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('camera')
        .doc(uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          Alamat = snapshot.data()!['Alamat'];
          FotoKamera = snapshot.data()!['FotoKamera'];
          Deskripsi = snapshot.data()!['Deskripsi'];
          Harga = snapshot.data()!['Harga'];
          ModelKamera = snapshot.data()!['ModelKamera'];
          NamaToko = snapshot.data()!['NamaToko'];
          ProfilPict = snapshot.data()!['ProfilPict'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  Widget listViewWidget(String Alamat, String Deskripsi, String FotoKamera,
      String Harga, String ModelKamera, String NamaToko, String ProfilPict) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return EditKamera();
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image(
                    image: NetworkImage(FotoKamera),
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                child: Text(
                  NamaToko,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ModelKamera,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Harga + ' / Hari',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Text(
                  Alamat,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(250, 0, 0, 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff1EBBDD), // background/ foreground
                        ),
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
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
                            'Toko Saya',
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
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Text('Produk',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('camera')
                      .where("id",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return listViewWidget(
                                snapshot.data!.docs[index]['Alamat'],
                                snapshot.data!.docs[index]['Deskripsi'],
                                snapshot.data!.docs[index]['FotoKamera'],
                                snapshot.data!.docs[index]['Harga'],
                                snapshot.data!.docs[index]['ModelKamera'],
                                snapshot.data!.docs[index]['NamaToko'],
                                snapshot.data!.docs[index]['ProfilPict'],
                              );
                            });
                      } else {
                        return Center(
                          child: Text('There is no task'),
                        );
                      }
                    }
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
