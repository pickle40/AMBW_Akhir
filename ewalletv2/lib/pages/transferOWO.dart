import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewalletv2/database/dataClass/dcHistory.dart';
import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class transferOWO extends StatefulWidget {
  const transferOWO({Key? key}) : super(key: key);

  @override
  State<transferOWO> createState() => _transferOWOState();
}

class _transferOWOState extends State<transferOWO> {
  String loggedInUser_noTelp = "";
  String noTelpPenerima = "";
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
  int nominaltf = 0;
  int saldoPenerima = 0;
  int saldoPengirim = 0;

  //testing
  // String notelptesting = "031";
  // String notelppenerimatesting = "081322116644";

  var menuItem;

  int NominalPengirim = 0;

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
      title: "Transfer Sesama OWO",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transfer Sesama OWO"),
        ),
        body: FutureBuilder<List>(
          future: DatabaseUser.getUserData(loggedInUser_noTelp),
          builder: (context, future) {
            if (future.hasData && future.data != null) {
              // for (int i = 0; i < snapshot.data!.docs.length; i++) {
              //   DocumentSnapshot dataPengirim = snapshot.data!.docs[i];
              //   NamaPengirim = dataPengirim['Nama'];
              //   noTelpPengirim = dataPengirim['Notelp'];
              //   NominalPengirim = dataPengirim['Uang'];
              // }

              return Container(
                child: Wrap(
                  children: [
                    Container(
                      color: Colors.blueAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: Navigator.of(context).pop,
                            // onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "Ke Sesama OWO",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          //border: OutlineInputBorder(),
                                          labelText: "Masukkan nomor ponsel",
                                        ),
                                        onChanged: (inputtelp) {
                                          noTelpPenerima = inputtelp;
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Icon(Icons.note_alt_outlined),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                          SizedBox(height: 15),
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
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 20, 16, 30),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 235, 227, 227),
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
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text("Pilih Kategori:"),
                                    ),
                                    Container(
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream:
                                            DatabaseKategori.filterDataKategori(
                                                notelp: loggedInUser_noTelp),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData ||
                                              snapshot.data != null) {
                                            List<DropdownMenuItem>
                                                dataKategori = [];
                                            for (int i = 0;
                                                i < snapshot.data!.docs.length;
                                                i++) {
                                              DocumentSnapshot data =
                                                  snapshot.data!.docs[i];
                                              dataKategori.add(
                                                DropdownMenuItem(
                                                  child: Text(data['Nama']),
                                                  value: "${data['Nama']}",
                                                ),
                                              );
                                            }
                                            return DropdownButton<dynamic>(
                                              items: dataKategori,
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    menuItem = value;
                                                  },
                                                );
                                              },
                                              value: menuItem,
                                              isExpanded: false,
                                              hint: Text("Pilih Kategori"),
                                            );
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Colors.pinkAccent,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: FutureBuilder<List>(
                              //stream harus bisa dapat data penerima dan pengirim
                              future: DatabaseUser.getUserDataPenerima(
                                  noTelpPenerima),
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != null) {
                                  // for (int i = 0;
                                  //     i < snapshot.data!.docs.length;
                                  //     i++) {
                                  //   DocumentSnapshot dataPenerima =
                                  //       snapshot.data!.docs[i];
                                  //   NamaPenerima = dataPenerima['Nama'];
                                  //   noTelpPenerima = dataPenerima['Notelp'];
                                  //   NominalPenerima = dataPenerima['Uang'];
                                  // }
                                  return Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //Untuk Penerima
                                        saldoPenerima = snapshot.data![0]
                                                ['uang'] +
                                            nominaltf;
                                        final dtPenerima = History(
                                            Kategori: "Pendapatan",
                                            subKategori: "Transfer",
                                            //Nama Pengirim
                                            Nama: future.data![0]['nama'],
                                            //nomor telepon penerima
                                            NoTelp: snapshot.data![0]['notelp'],
                                            //nominal penerima (nominal penerima saat ini + nominal yang dikirim)
                                            Nominal: nominaltf,
                                            TanggalTransaksi: date);
                                        DatabaseHistory.tambahData(
                                            history: dtPenerima);
                                        final dtupdatepenerima = User(
                                            alamat: snapshot.data![0]['alamat'],
                                            email: snapshot.data![0]['email'],
                                            nama: snapshot.data![0]['nama'],
                                            norek: snapshot.data![0]['norek'],
                                            notelp: snapshot.data![0]['notelp'],
                                            uang: saldoPenerima,
                                            passcode: snapshot.data![0]
                                                ['passcode']);
                                        DatabaseUser.updateData(
                                            data: dtupdatepenerima);

                                        //Untuk pengirim
                                        saldoPengirim =
                                            future.data![0]['uang'] - nominaltf;
                                        final dtPengirim = History(
                                            Kategori: "Pengeluaran",
                                            subKategori: menuItem,
                                            //Nama Penerima
                                            Nama: snapshot.data![0]['nama'],
                                            //nomor telepon pengirim
                                            NoTelp: future.data![0]['notelp'],
                                            //nominal pengirim (nominal pengirim saat ini - nominal yang dikirim)
                                            Nominal: nominaltf,
                                            TanggalTransaksi: date);
                                        DatabaseHistory.tambahData(
                                            history: dtPengirim);
                                        final dtupdatepengirim = User(
                                            alamat: future.data![0]['alamat'],
                                            email: future.data![0]['email'],
                                            nama: future.data![0]['nama'],
                                            norek: future.data![0]['norek'],
                                            notelp: future.data![0]['notelp'],
                                            uang: saldoPengirim,
                                            passcode: future.data![0]
                                                ['passcode']);
                                        DatabaseUser.updateData(
                                            data: dtupdatepengirim);

                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => home()));
                                      },
                                      child: Text("Kirim Sekarang"),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.lightBlueAccent,
                                        fixedSize: Size.fromWidth(350),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Text("Tidak ada Data yang ditemukan");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("Data tidak ditemukan");
            }
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
