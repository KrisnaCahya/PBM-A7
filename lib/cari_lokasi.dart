import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/lokasi_banyuwangi.dart';
import 'package:pbma7/findlocation.dart';

class CariLokasi extends StatelessWidget {
  const CariLokasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Navbar()),
                          );
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Cari Lokasi',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.location_pin,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindLocation(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Kota Utama',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFF1EBBDD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/surabaya.png',
                            width: double.infinity,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Surabaya',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFF1EBBDD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/jember.png',
                            width: double.infinity,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Jember',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LokasiBanyuwangi(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFF1EBBDD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/banyuwangi.png',
                            width: double.infinity,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Banyuwangi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFF1EBBDD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/mojokerto.png',
                            width: double.infinity,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Mojokerto',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFF1EBBDD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/lumajang.png',
                            width: double.infinity,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Lumajang',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
