import 'package:ewalletv2/pages/deposit.dart';
import 'package:ewalletv2/pages/history.dart';
import 'package:ewalletv2/pages/profile.dart';
import 'package:ewalletv2/pages/tarikDana.dart';
import 'package:ewalletv2/pages/transfer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("E-Wallet"),
        ),
        body: Wrap(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 10, 50),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade600,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "E-Waller Cash",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "Rp 38.100",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "Points 518",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                        transform: Matrix4.translationValues(0.0, -25, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox.fromSize(
                                    size: Size(56, 56),
                                    child: InkWell(
                                      splashColor: Colors.purpleAccent,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    deposit()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_rounded,
                                            color: Colors.purple,
                                          ),
                                          Text(
                                            "Top Up",
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox.fromSize(
                                    size: Size(56, 56),
                                    child: InkWell(
                                      splashColor: Colors.purpleAccent,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Transfer()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_circle_right,
                                            color: Colors.purple,
                                          ),
                                          Text(
                                            "Transfer",
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox.fromSize(
                                    size: Size(60, 60),
                                    child: InkWell(
                                      splashColor: Colors.purpleAccent,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    tarikDana()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.download,
                                            color: Colors.purple,
                                          ),
                                          Text(
                                            "Tarik Tunai",
                                            style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox.fromSize(
                                    size: Size(56, 56),
                                    child: InkWell(
                                      splashColor: Colors.purpleAccent,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    History()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.history,
                                            color: Colors.purple,
                                          ),
                                          Text(
                                            "History",
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.phone_android,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Container(
                                child: Text("Pulsa"),
                              )
                            ],
                          )),
                          Container(
                              child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.signal_cellular_alt_sharp,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Container(
                                child: Text("Paket Data"),
                              )
                            ],
                          )),
                          Container(
                              child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.electrical_services,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Container(
                                child: Text("PLN"),
                              )
                            ],
                          )),
                          Container(
                              child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.note_alt,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              Container(
                                child: Text("Invest"),
                              )
                            ],
                          )),
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 8.0, color: Color.fromARGB(255, 230, 223, 223)),
                ),
              ),
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(top: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('images/image1.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('images/image2.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 180,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8),
                  ),
                ],
              ),
            )
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
      ),
    );
  }
}
