import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewalletv2/database/dataClass/dcHistory.dart';
import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tarikDana extends StatefulWidget {
  const tarikDana({Key? key}) : super(key: key);

  @override
  State<tarikDana> createState() => _tarikDanaState();
}

class _tarikDanaState extends State<tarikDana> {
  int nominaltf = 0;
  int saldo = 0;

  String loggedInUser_noTelp = "";

  //untuk testing
  // String notelptesting = "081322116644";

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
      title: "Tarik Tunai",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tarik Tunai"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      color: Colors.blueAccent,
                    ),
                    Text(
                      "Tarik Tunai",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: FutureBuilder<List>(
                  future: DatabaseUser.getUserData(loggedInUser_noTelp),
                  builder: (context, future) {
                    if (future.hasData &&
                        future.data != null &&
                        future.data![0]['norek'] != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 25),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    child: Icon(Icons.timelapse_rounded),
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
                                              EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child: Text(
                                            "ATM BCA",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Text(
                                          "Metode Penarikan",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nominal Penarikan (Min. Rp. 50.000)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rp. ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: TextField(
                                        textDirection: TextDirection.ltr,
                                        decoration: InputDecoration(
                                          hintText: "${nominaltf}",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onChanged: (nominal) {
                                          nominaltf = int.parse(nominal);
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "+ Rp. 5.000 biaya admin",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (future.data![0]['uang'] - 5000 >= 50000) {
                                    saldo =
                                        future.data![0]['uang'] - nominaltf;
                                    final dtuserbalance = User(
                                        alamat: future.data![0]['alamat'],
                                        email: future.data![0]['email'],
                                        nama: future.data![0]['nama'],
                                        norek: future.data![0]['norek'],
                                        notelp: future.data![0]['notelp'],
                                        uang: saldo,
                                        passcode: future.data![0]['passcode']);
                                    DatabaseUser.updateData(
                                        data: dtuserbalance);

                                    final dthistory = History(
                                        Kategori: "Pengeluaran",
                                        subKategori: "Tarik Dana",
                                        Nama: future.data![0]['nama'],
                                        NoTelp: future.data![0]['notelp'],
                                        Nominal: nominaltf - 5000,
                                        TanggalTransaksi: "27-06-2022");
                                    DatabaseHistory.tambahData(
                                        history: dthistory);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Saldo kamu kurang dari 50.000")),
                                    );
                                  }
                                },
                                child: Text("Kirim Sekarang"),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent,
                                  fixedSize: Size.fromWidth(350),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              "Kamu belum memasukan nomor rekening bank.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => home()));
                              },
                              child: Text("Kembali"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
