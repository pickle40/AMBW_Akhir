import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/pages/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'history.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool panel1 = false;
  bool panel2 = false;
  bool panel3 = false;
  String login_user = "081322116644";

  @override
  void initState() {
    super.initState();
    // getLoginUserData();
  }

  // void getLoginUserData() async {
  //   var data = await DatabaseUser.getUserData(login_user);
  //   if (data.length > 0) {
  //     loggedIn_nama = data[0]['nama'];
  //     loggedIn_email = data[0]['email'];
  //     loggedIn_norek = data[0]['norek'];
  //     loggedIn_notelp = data[0]['notelp'];
  //     loggedIn_alamat = data[0]['alamat'];
  //     loggedIn_uang = data[0]['uang'];
  //     // print(data);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My Profile"),
          ),
          body: FutureBuilder<List>(
            future: DatabaseUser.getUserData(login_user),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                // print(snapshot.data![0]['nama']);
                return ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color:
                                          Color.fromARGB(255, 230, 223, 223)),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 212, 214),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 231, 223, 223),
                                            width: 5)),
                                    child: Icon(
                                      Icons.people_rounded,
                                    ),
                                    padding: EdgeInsets.all(15),
                                    //margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    //color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 3),
                                              child: Text(
                                                snapshot.data![0]['nama'],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                              child: Text(
                                                snapshot.data![0]['notelp'],
                                                textAlign: TextAlign.left,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        NumberFormat.currency(locale: 'id')
                                            .format(snapshot.data![0]['uang']),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //         child: Container(
                        //       child: ExpansionPanelList(
                        //         expansionCallback: (panelIndex, isExpanded) {
                        //           panel1 = !panel1;
                        //           setState(() {});
                        //         },
                        //         children: [
                        //           ExpansionPanel(
                        //               headerBuilder: (context, isExpanded) {
                        //                 return Row(
                        //                   children: [
                        //                     Container(
                        //                       padding:
                        //                           EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //                       child: Row(
                        //                         children: [
                        //                           Container(
                        //                             padding: EdgeInsets.all(10),
                        //                             child: Icon(
                        //                                 Icons.lock_clock_rounded),
                        //                           ),
                        //                           Container(
                        //                             margin: EdgeInsets.fromLTRB(
                        //                                 15, 0, 0, 0),
                        //                             child: Text(
                        //                               "OVO Premier",
                        //                               style: TextStyle(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     )
                        //                   ],
                        //                 );
                        //               },
                        //               body: Wrap(
                        //                 children: [
                        //                   Container(
                        //                       padding: EdgeInsets.fromLTRB(
                        //                           15, 0, 15, 15),
                        //                       child: Text(
                        //                           "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting."))
                        //                 ],
                        //               ),
                        //               isExpanded: panel1,
                        //               canTapOnHeader: true)
                        //         ],
                        //       ),
                        //     ))
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //         child: Container(
                        //       child: ExpansionPanelList(
                        //         expansionCallback: (panelIndex, isExpanded) {
                        //           panel2 = !panel2;
                        //           setState(() {});
                        //         },
                        //         children: [
                        //           ExpansionPanel(
                        //               headerBuilder: (context, isExpanded) {
                        //                 return Row(
                        //                   children: [
                        //                     Container(
                        //                       padding:
                        //                           EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //                       child: Row(
                        //                         children: [
                        //                           Container(
                        //                             padding: EdgeInsets.all(10),
                        //                             child: Icon(
                        //                                 Icons.lock_clock_rounded),
                        //                           ),
                        //                           Container(
                        //                             margin: EdgeInsets.fromLTRB(
                        //                                 15, 0, 0, 0),
                        //                             child: Text(
                        //                               "OVO Points",
                        //                               style: TextStyle(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.bold),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     )
                        //                   ],
                        //                 );
                        //               },
                        //               body: Wrap(
                        //                 children: [
                        //                   Container(
                        //                       padding: EdgeInsets.fromLTRB(
                        //                           15, 0, 15, 15),
                        //                       child: Text(
                        //                           "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting."))
                        //                 ],
                        //               ),
                        //               isExpanded: panel2,
                        //               canTapOnHeader: true)
                        //         ],
                        //       ),
                        //     ))
                        //   ],
                        // ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color:
                                          Color.fromARGB(255, 230, 223, 223)),
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 6, 0, 6),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.qr_code),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Text(
                                      snapshot.data![0]['norek'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color:
                                          Color.fromARGB(255, 230, 223, 223)),
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 6, 0, 6),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.mail),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Text(
                                      snapshot.data![0]['email'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color:
                                          Color.fromARGB(255, 230, 223, 223)),
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 6, 0, 6),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.location_pin),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Text(
                                      snapshot.data![0]['alamat'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 15, 10, 20),
                              child: Text(
                                "N0. REK",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 8.0,
                                      color:
                                          Color.fromARGB(255, 230, 223, 223)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 230, 223, 223))),
                                      padding:
                                          EdgeInsets.fromLTRB(45, 10, 45, 10),
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Icon(Icons.qr_code),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text("QR Code"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       border: Border.all(
                                  //           color: Color.fromARGB(
                                  //               255, 230, 223, 223))),
                                  //   padding:
                                  //       EdgeInsets.fromLTRB(45, 10, 45, 10),
                                  //   margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  //   child: Row(
                                  //     children: [
                                  //       Container(
                                  //         child: Icon(Icons.qr_code_2),
                                  //       ),
                                  //       Container(
                                  //         margin:
                                  //             EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  //         child: Text("QR Code"),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.grey))),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => History()));
                                  },
                                  child: Text("Riwayat Transaksi")),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 5, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            final oldData = User(
                                                alamat: snapshot.data![0]
                                                    ['alamat'],
                                                email: snapshot.data![0]
                                                    ['email'],
                                                nama: snapshot.data![0]['nama'],
                                                norek: snapshot.data![0]
                                                    ['norek'],
                                                notelp: snapshot.data![0]
                                                    ['notelp'],
                                                uang: snapshot.data![0]['uang'],
                                                passcode: snapshot.data![0]
                                                    ['passcode']);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Editprofile(
                                                          dataUser: oldData,
                                                        )));
                                          },
                                          child: Text("Edit Profile")),
                                    ),
                                  )
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Sign Out")),
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        )
                      ],
                    )
                  ],
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
