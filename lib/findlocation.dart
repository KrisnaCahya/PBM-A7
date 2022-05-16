import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindLocation extends StatefulWidget {
  const FindLocation({Key? key}) : super(key: key);

  @override
  _FindLocationState createState() => _FindLocationState();
}

class _FindLocationState extends State<FindLocation> {
  late final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final LatLng _FindPosition = LatLng(-8.36351432, -245.85438859);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("RCM"),
        position: _FindPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

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
            CameraPosition(target: _FindPosition, zoom: 14.0),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
