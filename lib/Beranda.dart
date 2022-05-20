import 'package:flutter/material.dart';
import 'package:pbma7/cari_lokasi.dart';
import 'package:pbma7/lokasi_banyuwangi.dart';
import 'package:pbma7/pesancam.dart';
import 'style/style.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox(),
            Container(
              height: 276,
              color: color1,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(5, 60, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Cari kamera disekitar anda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CariLokasi(),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Cari Lokasi",
                      prefixIconColor: Colors.grey,
                      prefixStyle: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  )
                ],
              ),
            ),
            Container(
                child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    height: 130,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(35, 320, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PesanCam(),
                            ),
                          );
                        },
                        child: Column(
                          children: const [
                            Spacer(),
                            Image(
                              image: AssetImage("assets/images/psncam.png"),
                            ),
                            Spacer(),
                            Text("Pesan Kamera",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff867F7F),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ))),
                Container(
                    padding: EdgeInsets.all(10),
                    height: 130,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(20, 320, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: const [
                            Spacer(),
                            Image(
                              image: AssetImage(
                                "assets/images/dftrcam.png",
                              ),
                            ),
                            Spacer(),
                            Text("Daftarkan Kamera",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff867F7F),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ))),
                Container(
                    padding: EdgeInsets.all(10),
                    height: 130,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(20, 320, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: const [
                            Spacer(),
                            Image(
                              image: AssetImage("assets/images/promosi.png"),
                            ),
                            Spacer(),
                            Text("Promosi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff867F7F),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ))),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
