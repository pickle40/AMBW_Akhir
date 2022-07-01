import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class Cart {
  String id;
  final String Nama, noTelp;
  final int jumData;

  Cart({
    this.id = "",
    required this.Nama,
    required this.jumData,
    required this.noTelp,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'Nama': Nama, 'jumData': jumData, 'noTelp': noTelp};
}

class _CategoryListState extends State<CategoryList> {
  String Nama = "";
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jumDataController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  final CollectionReference _kategori = FirebaseFirestore.instance
      .collection('Kategori'); //.where('noTelp', isEqualTo: noTelp);

  String? noTelp;
  int? jumData;

  List<Cart> data = [
    Cart(
      Nama: 'test 1',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 2',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 3',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 4',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 5',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 6',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 7',
      jumData: 0,
      noTelp: '031123',
    ),
    Cart(
      Nama: 'test 8',
      jumData: 0,
      noTelp: '031123',
    ),
  ];

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String nama = _namaController.text;
                    // final int? jumData = _jumDataController.text;
                    if (nama != null) {
                      await _kategori.add({
                        "Nama": Nama,
                        // "jumData": jumData
                      });

                      _namaController.text = '';
                      // _jumDataController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namaController.text = documentSnapshot['Nama'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String Nama = _namaController.text;
                    if (Nama != null) {
                      await _kategori
                          .doc(documentSnapshot!.id)
                          .update({"Nama": Nama});
                      _namaController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String kategoriId) async {
    await _kategori.doc(kategoriId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a category')));
  }

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

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
    //search by Category Name
    List<Cart> searchlist = data
        .where((element) =>
            element.Nama.toLowerCase().contains(Nama.toLowerCase()))
        .toList();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            title: Text("Category"),
            bottom: PreferredSize(
              preferredSize: Size(3, 130),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: _namaController,
                        onFieldSubmitted: (covariant) {
                          setState(() {
                            Nama = covariant;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Search ...",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 3),
                      child: Text(
                        "Search for $Nama",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: StreamBuilder(
            stream: _kategori
                .where("notelp", isEqualTo: "loggedInUser_noTelp")
                .snapshots(), // connect to fire
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        var data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;

                        if (Nama.isEmpty) {
                          return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 25),
                                height: 73,
                                child: Row(children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            data['Nama'].toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            // Press this button to edit a single product
                                            IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () =>
                                                    _update(documentSnapshot)),
                                            // This icon button is used to delete a single product
                                            IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () => _delete(
                                                    documentSnapshot.id)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              Divider(
                                thickness: 2,
                              )
                            ],
                          );
                        }

                        //search by categori
                        if (data['nama']
                            .toString()
                            .toLowerCase()
                            .startsWith(Nama.toLowerCase())) {
                          return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 25),
                                height: 73,
                                child: Row(children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            data['Nama'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            // Press this button to edit a single product
                                            IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () =>
                                                    _update(documentSnapshot)),
                                            // This icon button is used to delete a single product
                                            IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () => _delete(
                                                    documentSnapshot.id)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              Divider(
                                thickness: 2,
                              )
                            ],
                          );
                        }

                        return Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      child: TextFormField(
                                        controller: _namaController,
                                        onFieldSubmitted: (covariant) {
                                          setState(() {
                                            Nama = covariant;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.list,
                                          ),
                                          hintText: "Add New Categories",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
            },
          ),
          // Add new product
          floatingActionButton: FloatingActionButton(
            onPressed: () => _create(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
