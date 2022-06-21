import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewallet/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authServices.dart';

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

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();

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
        backgroundColor: Colors.red[900],
        body: SafeArea(
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
                          final String password = _passcontroller.text.trim();
                          final String name = _namecontroller.text.trim();
                          final String telp = _telpcontroller.text.trim();

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
                                content: Text("No Telepon kamu masih kosong"),
                              ),
                            );
                          } else {
                            // context
                            //     .read<AuthService>()
                            //     .Register(email, password).then((value) async {
                            //       User? user = FirebaseAuth.instance.currentUser;

                            //       await FirebaseFirestore.instance.collection("User").doc(user.notelp).set(data)
                            //     })
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          }
                        },
                        child: Text("Sign Up"),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red[100],
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
      ),
    );
  }
}
