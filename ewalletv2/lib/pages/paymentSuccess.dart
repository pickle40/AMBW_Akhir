import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';

class paymentSuccess extends StatefulWidget {
  const paymentSuccess({ Key? key }) : super(key: key);

  @override
  State<paymentSuccess> createState() => _paymentSuccessState();
}

class _paymentSuccessState extends State<paymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done,
                  color: Colors.green[400],
                  size: 160,
                ),
                SizedBox(height: 5),
                Text(
                  'Your payment was done successfully',
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    child: Text('OK')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}