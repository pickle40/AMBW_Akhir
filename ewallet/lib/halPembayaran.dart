import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class transferOWO extends StatefulWidget {
  const transferOWO({Key? key}) : super(key: key);

  @override
  State<transferOWO> createState() => _transferOWOState();
}

class _transferOWOState extends State<transferOWO> {
  String noTelp = "";
  String msg = "";
  int balance = 50000;
  int nominaltf = 0;

  final List<String> contoh = [
    "David",
    "Riski",
    "Tanoto",
  ];
  String? menuItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Transfer Sesama OWO",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transfer Sesama OWO"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      "Ke Sesama OWO",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Masukkan nomor ponsel",
                      ),
                      onChanged: (inputtelp) {
                        noTelp = inputtelp;
                      },
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Sumber Dana",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Wrap(
                        spacing: 25,
                        alignment: WrapAlignment.center,
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
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
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
                                  textDirection: TextDirection.ltr,
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
                    SizedBox(height: 20),
                    Text("Pilih Kategori:"),
                    DropdownButton<String>(
                      items: contoh.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          menuItem = value;
                        });
                      },
                      value: menuItem,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        hintText: "Pesan (opstional)",
                      ),
                      minLines: 1,
                      maxLines: 5,
                      onChanged: (pesan) {
                        msg = pesan;
                      },
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Kirim Sekarang"),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.lightGreenAccent,
                              fixedSize: Size.fromWidth(350),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
