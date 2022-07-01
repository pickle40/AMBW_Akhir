import 'package:ewalletv2/database/dataClass/dcHistory.dart';
import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class transferBank extends StatefulWidget {
  const transferBank({Key? key}) : super(key: key);

  @override
  State<transferBank> createState() => _transferBankState();
}

class _transferBankState extends State<transferBank> {
  String loggedInUser_noTelp = "";
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
  int nominaltf = 0;
  int saldo = 0;

  final List<String> contoh = [
    "BCA",
    "BNI",
    "BRI",
  ];

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

  var menuItem;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Transfer Bank",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transfer Bank"),
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
                      "Ke Rekening Bank",
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
                      if(future.hasData && future.data != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text("Bank Tujuan:"),
                          DropdownButton<String>(
                            items: contoh.map(buildMenuItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                menuItem = value;
                              });
                            },
                            value: menuItem,
                          ),
                          SizedBox(height: 25),
                          Text(
                            "Sumber Dana",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
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
                                            "OWO Cash",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Text(
                                        NumberFormat.currency(locale: 'id')
                                            .format(future.data![0]['uang']),
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nominal Transfer",
                                  style: TextStyle(
                                    color: Colors.black,
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
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: TextField(
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
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (nominaltf != 0) {
                                    if (future.data![0]['uang'] >= nominaltf) {
                                      saldo =
                                          future.data![0]['uang'] - nominaltf;
                                      final dtuserbalance = User(
                                          alamat: future.data![0]['alamat'],
                                          email: future.data![0]['email'],
                                          nama: future.data![0]['nama'],
                                          norek: future.data![0]['norek'],
                                          notelp: future.data![0]['notelp'],
                                          uang: saldo,
                                          passcode: future.data![0]
                                              ['passcode']);
                                      DatabaseUser.updateData(
                                          data: dtuserbalance);

                                      final dthistory = History(
                                          Kategori: "Pengeluaran",
                                          subKategori:
                                              "Transfer Bank $menuItem",
                                          Nama: future.data![0]['nama'],
                                          NoTelp: future.data![0]['notelp'],
                                          Nominal: nominaltf,
                                          TanggalTransaksi: date);
                                      DatabaseHistory.tambahData(
                                          history: dthistory);
                                      
                                      Navigator.push(
                                        context,
                                            new MaterialPageRoute(
                                            builder: (context) => home()));
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Saldo Owo kamu tidak cukup.")),
                                    );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Isi Nominal Transfer kamu.")),
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
                    }
                    else {
                      return Center(child: const CircularProgressIndicator());
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
