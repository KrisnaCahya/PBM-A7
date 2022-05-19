import 'package:flutter/material.dart';
import 'package:pbma7/navbar.dart';
import 'package:pbma7/order.dart';

class PesanCam extends StatefulWidget {
  const PesanCam({Key? key}) : super(key: key);

  @override
  State<PesanCam> createState() => _PesanCamState();
}

class _PesanCamState extends State<PesanCam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navbar(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Menampilkan Kamera Disekitar',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.start,
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list,
                        size: 15,
                      ),
                      label: Text("Filter"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF9E9E9E))))),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Order(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 255,
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
                            child: const Image(
                              image: AssetImage("assets/images/canon.png"),
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                          child: Text(
                            'Digi Campro',
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
                            children: const [
                              Text(
                                'CANON 1100D',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'RP. 100.000 / Hari',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: Text(
                            'Jember',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                          child: Row(
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
                                Icons.star_half,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 255,
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
                          child: const Image(
                            image: AssetImage("assets/images/nikon.png"),
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                        child: Text(
                          'Ari Rent',
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
                          children: const [
                            Text(
                              'NIKON D7200',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'RP. 90.000 / Hari',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: Text(
                          'Mojokerto',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                        child: Row(
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
                              Icons.star_half,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
