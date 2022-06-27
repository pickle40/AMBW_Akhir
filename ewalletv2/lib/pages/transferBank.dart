import 'package:ewalletv2/database/dataClass/dcHistory.dart';
import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class transferBank extends StatefulWidget {
  const transferBank({Key? key}) : super(key: key);

  @override
  State<transferBank> createState() => _transferBankState();
}

class _transferBankState extends State<transferBank> {
  String msg = "";
  int nominaltf = 0;
  int saldo = 0;

  final List<String> contoh = [
    "BCA",
    "BNI",
    "BRI",
  ];

  String loggedInUser_noTelp = "";

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
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Wrap(
                              spacing: 25,
                              alignment: WrapAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_alarm_outlined,
                                  color: Colors.black,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Owo Cash",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Saldo Rp. ${future.data![0]['uang']}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
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
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              hintText: "Pesan (opstional)",
                            ),
                            minLines: 1,
                            maxLines: 5,
                            onChanged: (pesan) {
                              msg = pesan;
                            },
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (nominaltf != 0) {
                                    saldo =
                                        future.data![0]['uang'] - nominaltf;
                                    final dtuserbalance = User(
                                        alamat: future.data![0]['alamat'],
                                        email: future.data![0]['email'],
                                        nama: future.data![0]['nama'],
                                        norek: future.data![0]['norek'],
                                        notelp: loggedInUser_noTelp,
                                        uang: saldo,
                                        passcode: future.data![0]['passcode']);
                                    DatabaseUser.updateData(
                                        data: dtuserbalance);

                                    final dthistory = History(
                                        Kategori: "Pengeluaran",
                                        subKategori: "Transfer Bank $menuItem",
                                        Nama: future.data![0]['nama'],
                                        NoTelp: loggedInUser_noTelp,
                                        Nominal: nominaltf,
                                        TanggalTransaksi: "27-06-2022");
                                    DatabaseHistory.tambahData(
                                        history: dthistory);
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
                                  backgroundColor: Colors.lightGreenAccent,
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
                    }),
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
