import 'package:flutter/material.dart';
import 'package:pbma7/Beranda.dart';
import 'package:pbma7/akun.dart';
import 'package:pbma7/chat.dart';
import 'package:pbma7/pemesanan.dart';
import 'style/style.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Beranda(),
    Pemesanan(),
    Chat(),
    Akun()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Beranda',
            backgroundColor: color1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: 'Pemesanan',
            backgroundColor: color1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_outlined),
            label: 'Chat',
            backgroundColor: color1,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            label: 'Akun',
            backgroundColor: color1,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
