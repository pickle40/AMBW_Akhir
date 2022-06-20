import 'package:provider/provider.dart';
import 'package:ewallet/authServices.dart';
import 'package:ewallet/home.dart';
import 'package:ewallet/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // text controller
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailcontroller.text.trim(),
  //     password: _passcontroller.text.trim(),
  //   );
  // }

  // bool password = false;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("oWopay"),
          backgroundColor: Color.fromARGB(255, 82, 10, 4),
        ),
        backgroundColor: Colors.red[900],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text, oWopay LOGO
                  Text(
                    'oWo Pay',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),

                  // e-mail
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
                      ), //child: padding
                    ),
                  ),

                  // password
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
                      ), //child: padding
                    ),
                  ),

                  // Button
                  SizedBox(height: 20),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           new MaterialPageRoute(
                  //               builder: (context) => Register()));
                  //     },
                  //     child: Container(
                  //       padding: EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         color: Colors.red[100],
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'Sign in',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.red[900],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // StreamBuilder<DocumentSnapshot>(
                  //   stream: DatabaseUser.getData(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       Map<String, dynamic>? dataUser =
                  //           snapshot.data!.data() as Map<String, dynamic>?;
                  //       String? usertelp = dataUser?['notelp'];
                  //       String? userpass = dataUser?['passcode'];
                  //       if (usertelp == _emailcontroller &&
                  //           userpass == _passcontroller) {
                  //         password = true;
                  //         return Text("");
                  //       } else {
                  //         return Text("Password Salah");
                  //       }
                  //     } else {
                  //       return Text("Data tidak ditemukan");
                  //     }
                  //   },
                  // ),
                  // Container(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               new MaterialPageRoute(
                  //                   builder: (context) => home()));
                  //         },
                  //         child: Text("Sign In"),
                  //         style: OutlinedButton.styleFrom(
                  //           backgroundColor: Colors.red[100],
                  //           fixedSize: Size.fromWidth(350),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(12),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final String email = _emailcontroller.text.trim();
                            final String password = _passcontroller.text.trim();

                            if (email.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Email kamu masih kosong"),
                                ),
                              );
                            } else if (password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Email kamu masih kosong"),
                                ),
                              );
                            } else {
                              context
                                  .read<AuthService>()
                                  .login(email, password);

                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => home()));
                            }
                          },
                          child: Text("Sign In"),
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
                  //Register , text
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ], //childern
                  ),

                  // LOGIN - Phone
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             new MaterialPageRoute(
                  //                 builder: (context) => home()));
                  //       },
                  //       child: Text(
                  //         'Login with phone number',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16.0,
                  //           decoration: TextDecoration.none,
                  //         ),
                  //       ),
                  //     ),
                  //   ], //childern
                  // ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
