import 'package:flutter/material.dart';

class qrPembayaran extends StatelessWidget {
  const qrPembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("OWO E-Wallet"),
          ),
          body: Center(
            child: Text("Coming Soon"),
          ),
        ));
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ewalletv2/database/dataClass/dcHistory.dart';
// import 'package:ewalletv2/database/dbServices.dart';
// import 'package:ewalletv2/pages/home.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class qrPembayaran extends StatefulWidget {
//   const qrPembayaran({ Key? key }) : super(key: key);

//   @override
//   State<qrPembayaran> createState() => _qrPembayaranState();
// }

// class _qrPembayaranState extends State<qrPembayaran> {

//   var menuItem;
  
//   int nominaltf = 0;
//   String msg = "";
//   String noTelpPenerima = "";
//   String loggedInUser_noTelp = "";

//   @override
//   void initState() {
//     super.initState();
//     getLoggedInUserData();
//   }

//   Future<void> getLoggedInUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       loggedInUser_noTelp = prefs.getString("loggedIn_noTelp").toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Transfer Sesama OWO",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Transfer Sesama OWO"),
//         ),
//         body: FutureBuilder<List>(
//           future:
//               DatabaseUser.getUserData(loggedInUser_noTelp),
//           builder: (context, future) {
//             if (future.hasData && future.data != null) {
//               return Container(
//                 child: Wrap(
//                   children: [
//                     Container(
//                       color: Colors.blueAccent,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           IconButton(
//                             onPressed: Navigator.of(context).pop,
//                             // onPressed: () {},
//                             icon: Icon(
//                               Icons.arrow_back,
//                               color: Colors.black,
//                             ),
//                             color: Colors.blueAccent,
//                           ),
//                           Text(
//                             "Ke Sesama OWO",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                   child: Container(
//                                 margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: TextField(
//                                         textDirection: TextDirection.ltr,
//                                         decoration: InputDecoration(
//                                           //border: OutlineInputBorder(),
//                                           labelText: "Masukkan nomor ponsel",
//                                         ),
//                                         onChanged: (inputtelp) {
//                                           noTelpPenerima = inputtelp;
//                                         },
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Icon(Icons.note_alt_outlined),
//                                     )
//                                   ],
//                                 ),
//                               ))
//                             ],
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             "Sumber Dana",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                             margin: EdgeInsets.fromLTRB(0, 10, 0, 25),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Colors.grey,
//                               ),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             ),
//                             child: Expanded(
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(15),
//                                     child: Icon(Icons.timelapse_rounded),
//                                   ),
//                                   Container(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           margin:
//                                               EdgeInsets.fromLTRB(0, 0, 0, 5),
//                                           child: Text(
//                                             "OWO Cash",
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16),
//                                           ),
//                                         ),
//                                         Text("Saldo Rp ${future.data![0]['uang']}")
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.fromLTRB(16, 20, 16, 30),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 235, 227, 227),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Nominal Transfer",
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Rp. ",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     Container(
//                                       width: 200,
//                                       child: TextField(
//                                         textDirection: TextDirection.ltr,
//                                         decoration: InputDecoration(
//                                           hintText: "${nominaltf}",
//                                           hintStyle: TextStyle(
//                                             fontSize: 16,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         onChanged: (nominal) {
//                                           nominaltf = int.parse(nominal);
//                                         },
//                                         keyboardType: TextInputType.number,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
//                             padding: EdgeInsets.all(5),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       child: Text("Pilih Kategori:"),
//                                     ),
//                                     Container(
//                                       child: StreamBuilder<QuerySnapshot>(
//                                         stream:
//                                             DatabaseKategori.filterDataKategori(
//                                                 notelp: loggedInUser_noTelp),
//                                         builder: (context, snapshot) {
//                                           if (snapshot.hasData ||
//                                               snapshot.data != null) {
//                                             List<DropdownMenuItem>
//                                                 dataKategori = [];
//                                             for (int i = 0;
//                                                 i < snapshot.data!.docs.length;
//                                                 i++) {
//                                               DocumentSnapshot data =
//                                                   snapshot.data!.docs[i];
//                                               dataKategori.add(
//                                                 DropdownMenuItem(
//                                                   child: Text(data['Nama']),
//                                                   value: "${data['Nama']}",
//                                                 ),
//                                               );
//                                             }
//                                             return DropdownButton<dynamic>(
//                                               items: dataKategori,
//                                               onChanged: (value) {
//                                                 setState(
//                                                   () {
//                                                     menuItem = value;
//                                                   },
//                                                 );
//                                               },
//                                               value: menuItem,
//                                               isExpanded: false,
//                                               hint: Text("Pilih Kategori"),
//                                             );
//                                           } else {
//                                             return Center(
//                                               child: CircularProgressIndicator(
//                                                 valueColor:
//                                                     AlwaysStoppedAnimation<
//                                                         Color>(
//                                                   Colors.pinkAccent,
//                                                 ),
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 ))
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.all(5),
//                             child: TextField(
//                               textDirection: TextDirection.ltr,
//                               decoration: InputDecoration(
//                                 hintText: "Pesan (optional)",
//                               ),
//                               minLines: 1,
//                               maxLines: 5,
//                               onChanged: (pesan) {
//                                 msg = pesan;
//                               },
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                             child: FutureBuilder<List>(
//                               //stream harus bisa dapat data penerima dan pengirim
//                               future: DatabaseUser.getUserData(noTelpPenerima),
//                               builder: (context, futurepenerima) {
//                                 if (futurepenerima.hasData && futurepenerima.data != null) {
//                                   return Center(
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         //Untuk Penerima
//                                         final dtPenerima = History(
//                                             Kategori: "Pendapatan",
//                                             subKategori: "",
//                                             //Nama Pengirim
//                                             Nama: future.data![0]['nama'],
//                                             //nomor telepon pengirim
//                                             NoTelp: loggedInUser_noTelp,
//                                             //nominal penerima (nominal penerima saat ini + nominal yang dikirim)
//                                             Nominal:
//                                                 futurepenerima.data![0]['uang'] + nominaltf,
//                                             TanggalTransaksi: "22-06-2022");
//                                         DatabaseHistory.tambahData(
//                                             history: dtPenerima);
//                                         //Untuk pengirim
//                                         final dtPengirim = History(
//                                             Kategori: "Pengeluaran",
//                                             subKategori: menuItem,
//                                             //Nama Penerima
//                                             Nama: futurepenerima.data![0]['nama'],
//                                             //nomor telepon penerima
//                                             NoTelp: noTelpPenerima,
//                                             //nominal pengirim (nominal pengirim saat ini - nominal yang dikirim)
//                                             Nominal:
//                                                 future.data![0]['uang'] - nominaltf,
//                                             TanggalTransaksi: "22-06-2022");
//                                         DatabaseHistory.tambahData(
//                                             history: dtPengirim);
//                                         Navigator.push(
//                                             context,
//                                             new MaterialPageRoute(
//                                                 builder: (context) => home()));
//                                       },
//                                       child: Text("Kirim Sekarang"),
//                                       style: OutlinedButton.styleFrom(
//                                         backgroundColor:
//                                             Colors.lightGreenAccent,
//                                         fixedSize: Size.fromWidth(350),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 } else {
//                                   return Text("Tidak ada Data yang ditemukan");
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               return Text("Data tidak ditemukan");
//             }
//           },
//         ),
//       ),
//     );
//   }

//   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
//         value: item,
//         child: Text(item),
//       );
// }