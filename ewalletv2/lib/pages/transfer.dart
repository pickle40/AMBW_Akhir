import 'package:ewalletv2/pages/transferBank.dart';
import 'package:ewalletv2/pages/transferOWO.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Transfer",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transfer"),
        ),
        body: Container(
          child: ListView(
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
                      "Transfer",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     new MaterialPageRoute(
                        //         builder: (context) => transferOWO()));
                      },
                      icon: Icon(
                        Icons.mobile_screen_share,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Ke Sesama OWO",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(150, 75)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => transferBank()));
                      },
                      icon: Icon(
                        Icons.museum_outlined,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Ke Rekening Bank",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(150, 75)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
