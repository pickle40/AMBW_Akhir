import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addRekening extends StatefulWidget {
  const addRekening({Key? key}) : super(key: key);

  @override
  State<addRekening> createState() => _addRekeningState();
}

class _addRekeningState extends State<addRekening> {
  String norekening = "";
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Add Rekening Bank",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Rekening Bank"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  Text(
                    "Add Rekening Bank",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Nomor Rekening Bank",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            Center(
              child: FutureBuilder<List>(
                  future: DatabaseUser.getUserData("081"),
                  builder: (context, future) {
                    if (future.hasData && future.data != null) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            TextField(
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Input Nomor Rekeningmu",
                              ),
                              onChanged: (rekening) {
                                norekening = rekening;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (norekening != null || norekening != "") {
                                  final dtuserrekening = User(
                                      alamat: future.data![0]['alamat'],
                                      email: future.data![0]['email'],
                                      nama: future.data![0]['nama'],
                                      norek: norekening,
                                      notelp: loggedInUser_noTelp,
                                      uang: future.data![0]['uang'],
                                      passcode: future.data![0]['passcode']);
                                  DatabaseUser.updateData(
                                      data: dtuserrekening);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => home()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Silahkan isi nomor rekening bank kamu.")),
                                  );
                                }
                              },
                              child: Text("Add Rekeningmu"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Text("Data tidak ditemukan");
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
