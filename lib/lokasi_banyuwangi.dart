import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiBanyuwangi extends StatefulWidget {
  const LokasiBanyuwangi({Key? key}) : super(key: key);

  @override
  _LokasiBanyuwangiState createState() => _LokasiBanyuwangiState();
}

class _LokasiBanyuwangiState extends State<LokasiBanyuwangi> {
  late final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final LatLng _posisiBanyuwangi = LatLng(-8.36351432, -245.85438859);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("RCM"),
        position: _posisiBanyuwangi,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  static CameraPosition get _LokasiBanyuwangi => const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-8.36351432, -245.85438859),
      tilt: 59,
      zoom: 19);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lokasi Camera"),
        backgroundColor: Color(0xFF197BFF),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition:
            CameraPosition(target: _posisiBanyuwangi, zoom: 14.0),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _setLokasiBanyuwangi,
        label: const Text('Genteng , Banyuwangi'),
        backgroundColor: Color(0xFF197BFF),
        icon: const Icon(Icons.store),
      ),
    );
  }

  Future<void> _setLokasiBanyuwangi() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_LokasiBanyuwangi));
  }
}
