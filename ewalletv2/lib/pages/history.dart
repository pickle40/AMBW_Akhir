import 'package:ewalletv2/pages/home.dart';
import 'package:ewalletv2/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/dbServices.dart';

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State {
  String loggedInUser_noTelp = "";
  int _selectedIndex = 2;

  //testing
  String notelptesting = "081322116644";

  Future<void> getLoggedInUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedInUser_noTelp = prefs.getString("loggedIn_noTelp").toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInUserData();
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {
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
          title: Text("Riwayat Transaksi"),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: DatabaseHistory.getGroupedData(loggedInUser_noTelp),
            builder: (context, future) {
              if (future.hasData || future.data != null) {
                return GroupedListView<dynamic, String>(
                  elements: future.data!,
                  groupBy: (element) => element['TanggalTransaksi'],
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1['Nama'].compareTo(item2['Nama']),
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Container(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 223, 223)),
                    child: Text(
                      value,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  itemBuilder: (c, element) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 230, 223, 223)),
                      )),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          // Container(
                          //   alignment: Alignment.topLeft,
                          //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          //   child: Text(element["Nama"],
                          //       style: TextStyle(
                          //           fontSize: 17, fontWeight: FontWeight.bold)),
                          // ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  element["Nama"],
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  element["subKategori"].toString().isEmpty
                                      ? ""
                                      : element["subKategori"].toString(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: element["Kategori"].toUpperCase() ==
                                    "PENGELUARAN"
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        element["Kategori"].toUpperCase(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "- " +
                                            NumberFormat.currency(locale: 'id')
                                                .format(element["Nominal"]),
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        element["Kategori"].toUpperCase(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "+ " +
                                            NumberFormat.currency(locale: 'id')
                                                .format(element["Nominal"]),
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            }),
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
