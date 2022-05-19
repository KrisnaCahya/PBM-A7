import 'package:flutter/material.dart';
import 'package:pbma7/order.dart';

class KonfirmasiPembayaran extends StatefulWidget {
  const KonfirmasiPembayaran({Key? key}) : super(key: key);

  @override
  State<KonfirmasiPembayaran> createState() => _KonfirmasiPembayaranState();
}

class _KonfirmasiPembayaranState extends State<KonfirmasiPembayaran> {
  DateTime date = DateTime(2022, 05, 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      color: Color(0xFF1EBBDD),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Order(),
                                    ),
                                  );
                                },
                                child: const Text('Back',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/canon.png',
                                    width: 100,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Canon EOS M100',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800)),
                                      Text('Digicam Pro',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                        'jl. jawa no 3, \nSumbersari, Jember',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Color(0xFF313131),
                          size: 24,
                        ),
                        const Text('Pilih Tanggal Penyewaan',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        InkWell(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2025));
                                if (newDate==null)return;
                                setState(() => date = newDate
                                );
                          },
                          child: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Color(0xFF313131),
                            size: 20,
                          ),
                        ),
                        const Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),),
                        Text('${date.year}/${date.month}/${date.day}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(
                          Icons.payment,
                          color: Color(0xFF313131),
                          size: 24,
                        ),
                        Text('Pilih Metode Pembayaran',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Color(0xFF313131),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(
                          Icons.money,
                          color: Color(0xFF313131),
                          size: 24,
                        ),
                        Text('Gunakan Voucher',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Color(0xFF313131),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total Pembayaran',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Rp. 100.000',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ],
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_sharp,
                    size: 20,
                  ),
                  label: Text("Konfirmasi"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    primary: Color(0xFFC82E2E),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
