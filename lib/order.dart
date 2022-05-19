import 'package:flutter/material.dart';
import 'package:pbma7/konfirmasi_pembayaran.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/pesancam.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/canon.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 24,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PesanCam(),
                            ),
                          );
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'CANON 1100D',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Sumbersari, Jember',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Icon(
                        Icons.star_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                      Icon(
                        Icons.star_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                      Icon(
                        Icons.star_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                      Icon(
                        Icons.star_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                      Icon(
                        Icons.star_outline,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          'assets/images/profilpict.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'Digi Campro',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(95, 0, 0, 0),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                primary: Colors.black,
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                )),
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            child: Text('Kunjungi Toko')),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  const Text(
                      'Deskripsi:\n- Sensor APS-C CMOS 24.2MP\n- Dual Pixel CMOS AF\n- 45 AF tipe silang (Viewfinder Optisk)\n- Built-In Wi-Fi dengan NFC, Bluetooth\n- DIGIC 7 Image Processor',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  const Text('Penilaian Produk',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'assets/images/profilpict2.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text('Pak Kumis',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 14)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star_outline,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ],
                            ),
                            const Text(
                                'Kameranya sangat bagus, harga sewanya murah',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat,
                        size: 20,
                      ),
                      label: Text("Chat Toko"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 40),
                        primary: Color(0xFF1EBBDD),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return KonfirmasiPembayaran();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_sharp,
                        size: 20,
                      ),
                      label: Text("Sewa Sekarang"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 40),
                        primary: Color(0xFFC82E2E),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
