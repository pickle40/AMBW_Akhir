import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class deposit extends StatefulWidget {
  const deposit({Key? key}) : super(key: key);

  @override
  State<deposit> createState() => _depositState();
}

class _depositState extends State<deposit> {
  int balance = 100;
  int y = 15;
  String norek = "102847192";

  //untuk Button
  bool isActived = true;
  bool hasaddedbank = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Deposit",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Deposit"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
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
                      "Top Up",
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
                    //Top-Up Ke
                    Text(
                      "Top Up Ke:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Wrap(
                        spacing: 50,
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
                                "Balance Rp. ${balance}",
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
                    //Bagian Nominal Top-Up
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pilih Nominal Top Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: isActived
                                    ? () {
                                        setState(() {});
                                      }
                                    : null,
                                child: Text("Rp. 100.000"),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: isActived
                                    ? () {
                                        setState(() {});
                                      }
                                    : null,
                                child: Text("Rp. 200.000"),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: isActived
                                    ? () {
                                        setState(() {});
                                      }
                                    : null,
                                child: Text("Rp. 500.000"),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2, color: Colors.redAccent),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Atau masukkan nominal top up di sini",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Minimal Rp. 10.000",
                            ),
                            onChanged: (nominal) {
                              balance = int.parse(nominal);
                            },
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kartu Debit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  child: hasaddedbank == false
                                      ? Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.add_card_outlined,
                                                color: Colors.green,
                                                size: 30,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "BCA",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    "${norek}",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.add_card_outlined,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    "Tambah Kartu Debit BCA",
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
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Top Up Sekarang"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
