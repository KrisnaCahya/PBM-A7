import 'package:flutter/material.dart';

Color color1 = const Color(0xff1EBBDD);

BorderRadius borderRadius1 = BorderRadius.circular(20);
BorderRadius borderRadius2 = BorderRadius.circular(50);

BoxShadow boxshadow1 = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 20,
    spreadRadius: 0,
    color: color1.withOpacity(0.6));
BoxShadow boxshadow2 = BoxShadow(
    offset: const Offset(0, 6),
    blurRadius: 16,
    spreadRadius: 0,
    color: Colors.black.withOpacity(0.3));
