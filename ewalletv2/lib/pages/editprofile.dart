import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:ewalletv2/pages/profile.dart';
import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  final User? dataUser;
  const Editprofile({Key? key, this.dataUser}) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _txt_nama = TextEditingController();
  final _txt_email = TextEditingController();
  final _txt_alamat = TextEditingController();
  final _txt_passcode = TextEditingController();

  @override
  void dispose() {
    _txt_nama.dispose();
    _txt_email.dispose();
    _txt_alamat.dispose();
    _txt_passcode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _txt_nama.text = widget.dataUser?.nama ?? "";
    _txt_email.text = widget.dataUser?.email ?? "";
    _txt_alamat.text = widget.dataUser?.alamat ?? "";
    _txt_passcode.text = widget.dataUser?.passcode ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Edit Profile"),
            ),
            body: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: _txt_nama,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Masukkan nama anda"),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: _txt_email,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Masukkan alamat email anda"),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: _txt_alamat,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Masukkan alamat anda"),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: _txt_passcode,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Masukkan passcode anda"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    final dt = User(
                                        alamat: _txt_alamat.text.toString(),
                                        email: _txt_email.text.toString(),
                                        nama: _txt_nama.text.toString(),
                                        norek: widget.dataUser!.norek,
                                        notelp: widget.dataUser!.notelp,
                                        uang: widget.dataUser!.uang,
                                        passcode: widget.dataUser!.passcode);

                                    DatabaseUser.updateData(data: dt);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => profile()));
                                  },
                                  child: Text("Update")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => profile()));
                                  },
                                  child: Text("Cancel")),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
