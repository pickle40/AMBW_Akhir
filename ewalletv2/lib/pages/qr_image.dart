import 'package:ewalletv2/pages/history.dart';
import 'package:ewalletv2/pages/home.dart';
import 'package:ewalletv2/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrimage extends StatefulWidget {
  final String? notelp;
  const Qrimage({Key? key, required this.notelp}) : super(key: key);

  @override
  _QrimageState createState() => _QrimageState();
}

class _QrimageState extends State<Qrimage> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => profile()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => History()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My QR-Code"),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: QrImage(
                      data: widget.notelp.toString(),
                      version: QrVersions.auto,
                      size: 350.0,
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.notelp.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profile()));
                            },
                            child: Text("Back")),
                      ))
                    ],
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Riwayat',
          ),
        ],
      ),
    ));
  }
}
