import 'package:ewalletv2/database/dataClass/dcKategori.dart';
import 'package:ewalletv2/database/dataClass/dcUsers.dart';
import 'package:ewalletv2/database/dbServices.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _telpcontroller = TextEditingController();
  final _norekcontroller = TextEditingController();
  final _alamatcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _namecontroller.dispose();
    _telpcontroller.dispose();
    _norekcontroller.dispose();
    _alamatcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("oWopay"),
          centerTitle: true,
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: ListView(
          shrinkWrap: true,
          children: [
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    // Text, oWopay
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'oWo Pay',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _namecontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'E-mail',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _telpcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone Numbers',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _alamatcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Alamat',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _norekcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nomor Rekening',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _passcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),

                    // Button
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final String email = _emailcontroller.text.trim();
                              final String password =
                                  _passcontroller.text.trim();
                              final String name = _namecontroller.text.trim();
                              final String telp = _telpcontroller.text.trim();
                              final String alamat =
                                  _alamatcontroller.text.trim();
                              final String norekening =
                                  _norekcontroller.text.trim();

                              if (email.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Email kamu masih kosong"),
                                  ),
                                );
                              } else if (password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Password kamu masih kosong"),
                                  ),
                                );
                              } else if (name.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Nama kamu masih kosong"),
                                  ),
                                );
                              } else if (telp.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("No Telepon kamu masih kosong"),
                                  ),
                                );
                              } else if (alamat.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Alamat kamu masih kosong"),
                                  ),
                                );
                              } else if (norekening.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Nomor Rekening kamu masih kosong"),
                                  ),
                                );
                              } else {
                                // context
                                //     .read<AuthService>()
                                //     .Register(email, password).then((value) async {
                                //       User? user = FirebaseAuth.instance.currentUser;

                                //       await FirebaseFirestore.instance.collection("User").doc(user.notelp).set(data)
                                //     })
                                final dtUser = User(
                                    alamat: alamat,
                                    email: email,
                                    nama: name,
                                    norek: norekening,
                                    notelp: telp,
                                    uang: 0,
                                    passcode: password);
                                DatabaseUser.tambahData(user: dtUser);

                                final dtKategori = Kategori(
                                    Nama: "", notelp: telp);
                                DatabaseKategori.tambahData(
                                    kategori: dtKategori);
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              }
                            },
                            child: Text("Sign Up"),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              fixedSize: Size.fromWidth(350),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //sign up , text
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Sign Up",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.red[900],
                    //     ),
                    //   ),
                    //   style: OutlinedButton.styleFrom(
                    //     backgroundColor: Colors.red[100],
                    //     fixedSize: Size.fromWidth(350),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
