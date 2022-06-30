import 'package:ewalletv2/database/dataClass/dcHistory.dart';
import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/main.dart';
import 'package:ewalletv2/pages/addRekening.dart';
import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class deposit extends StatefulWidget {
  const deposit({Key? key}) : super(key: key);

  @override
  State<deposit> createState() => _depositState();
}

class _depositState extends State<deposit> {
  int nominaltf = 0;
  int saldo = 0;
  //String norek = "102847192";
  String loggedInUser_noTelp = "";
  String notelptesting = "081081081999";

  //untuk Button
  bool isActived = true;
  bool hasaddedbank = true;

  @override
  void initState() {
    super.initState();
    getLoggedInUserData();
  }

  Future<void> getLoggedInUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedInUser_noTelp = prefs.getString("loggedIn_noTelp").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Deposit",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Deposit"),
          ),
          body: FutureBuilder<List>(
              future: DatabaseUser.getUserData(notelptesting),
              builder: (context, future) {
                if (future.hasData && future.data != null) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Header
                            Container(
                              color: Colors.blueAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => home()));
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Top Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Wrap(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      //Top-Up Ke
                                      Text(
                                        "Top Up Ke:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 10, 0, 25),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(15),
                                                child: Icon(
                                                    Icons.timelapse_rounded),
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 5),
                                                      child: Text(
                                                        "OWO Cash",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    //Text("Saldo Rp ${balance}")
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      //Bagian Nominal Top-Up
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 16, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Pilih Nominal Top Up",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                OutlinedButton(
                                                  onPressed: isActived
                                                      ? () {
                                                          setState(() {
                                                            nominaltf = 100000;
                                                          });
                                                        }
                                                      : null,
                                                  child: Text("Rp. 100.000"),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.redAccent),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                                OutlinedButton(
                                                  onPressed: isActived
                                                      ? () {
                                                          setState(() {
                                                            nominaltf = 200000;
                                                          });
                                                        }
                                                      : null,
                                                  child: Text("Rp. 200.000"),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.redAccent),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                                OutlinedButton(
                                                  onPressed: isActived
                                                      ? () {
                                                          setState(() {
                                                            nominaltf = 500000;
                                                          });
                                                        }
                                                      : null,
                                                  child: Text("Rp. 500.000"),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.redAccent),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Atau masukkan nominal top up di sini",
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            TextField(
                                              textDirection: TextDirection.ltr,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Minimal Rp. 10.000",
                                              ),
                                              onChanged: (nominal) {
                                                nominaltf = int.parse(nominal);
                                              },
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 16, 0, 0),
                                              child: Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Kartu Debit",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Container(
                                                        child: Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .card_membership,
                                                            color: Colors.green,
                                                            size: 30,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "BCA",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              Text(
                                                                future.data![0]
                                                                    ['norek'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          Center(
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                if (nominaltf.isNaN ||
                                                                    nominaltf
                                                                        .isNegative ||
                                                                    nominaltf <
                                                                        10000) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Jumlah deposit kurang dari 10000.")),
                                                                  );
                                                                } else {
                                                                  saldo = future
                                                                              .data![0]
                                                                          [
                                                                          'uang'] +
                                                                      nominaltf;
                                                                  final dtuserbalance = User(
                                                                      alamat: future.data![0][
                                                                          'alamat'],
                                                                      email: future
                                                                              .data![0][
                                                                          'email'],
                                                                      nama: future
                                                                              .data![0]
                                                                          [
                                                                          'nama'],
                                                                      norek:
                                                                          future.data![0]
                                                                              [
                                                                              'norek'],
                                                                      notelp:
                                                                          notelptesting,
                                                                      uang:
                                                                          saldo,
                                                                      passcode:
                                                                          future.data![0]
                                                                              ['passcode']);
                                                                  DatabaseUser
                                                                      .updateData(
                                                                          data:
                                                                              dtuserbalance);

                                                                  final dthistory = History(
                                                                      Kategori:
                                                                          "Pendapatan",
                                                                      subKategori:
                                                                          "Deposit",
                                                                      Nama: future
                                                                              .data![0]
                                                                          [
                                                                          'nama'],
                                                                      NoTelp:
                                                                          notelptesting,
                                                                      Nominal:
                                                                          nominaltf,
                                                                      TanggalTransaksi:
                                                                          "27-06-2022");
                                                                  DatabaseHistory
                                                                      .tambahData(
                                                                          history:
                                                                              dthistory);

                                                                  // Navigator.push(
                                                                  //     context,
                                                                  //     MaterialPageRoute(
                                                                  //         builder: (context) =>
                                                                  //             home()));
                                                                }
                                                              },
                                                              child: Text(
                                                                  "Top Up Sekarang"),
                                                              style:
                                                                  OutlinedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreenAccent,
                                                                fixedSize: Size
                                                                    .fromWidth(
                                                                        350),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),

                                                    // ElevatedButton(
                                                    //   onPressed: () {},
                                                    //   child: Text("Top Up Sekarang"),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  // loading
                  return Center(child: const CircularProgressIndicator());
                }
              })),
    );
  }
}
