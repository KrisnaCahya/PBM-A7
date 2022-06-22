import 'package:flutter/material.dart';
import 'package:pbma7/konfirmasi_pembayaran.dart';

class Order extends StatefulWidget {
  String Alamat;
  String Deskripsi;
  String FotoKamera;
  String Harga;
  String ModelKamera;
  String NamaToko;
  String ProfilPict;

  Order(this.Alamat, this.Deskripsi, this.FotoKamera, this.Harga,
      this.ModelKamera, this.NamaToko, this.ProfilPict,
      {Key? key})
      : super(key: key);

  @override
  State<Order> createState() => _OrderState(
        Alamat,
        Deskripsi,
        FotoKamera,
        Harga,
        ModelKamera,
        NamaToko,
        ProfilPict,
      );
}

class _OrderState extends State<Order> {
  String _Alamat;
  String _Deskripsi;
  String _FotoKamera;
  String _Harga;
  String _ModelKamera;
  String _NamaToko;
  String _ProfilPict;

  _OrderState(
    this._Alamat,
    this._Deskripsi,
    this._FotoKamera,
    this._Harga,
    this._ModelKamera,
    this._NamaToko,
    this._ProfilPict,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      _FotoKamera,
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
                              Navigator.of(context).pop('Back');
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
                      Text(
                        _ModelKamera,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _Alamat,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  _ProfilPict,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsetsDirectional.only(start: 10),
                              child: 
                              Text(
                                _NamaToko,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
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
                      Text('Deskripsi:\n' + _Deskripsi,
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
                        height: 200,
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
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10),
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
