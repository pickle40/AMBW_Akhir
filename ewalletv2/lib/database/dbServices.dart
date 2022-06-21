import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'dataClass/dcHistory.dart';
import 'dataClass/dcKategori.dart';
import 'dataClass/dcUsers.dart';

CollectionReference tblHistory =
    FirebaseFirestore.instance.collection("History");
CollectionReference tblKategori =
    FirebaseFirestore.instance.collection("Kategori");
CollectionReference tblUser = FirebaseFirestore.instance.collection("User");

class DatabaseHistory {
  static Stream<QuerySnapshot> getData() {
    return tblHistory.snapshots();
  }

  static Future<List> getGroupedData() async {
    QuerySnapshot querySnapshot = await tblHistory.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

  static Future<void> tambahData({required History history}) async {
    DocumentReference docRef = tblHistory.doc(history.NoTelp);

    await docRef
        .set(history.toJson())
        .whenComplete(() => print("data berhasil diinput"))
        .catchError((e) => print(e));
  }
}

class DatabaseKategori {
  static Stream<QuerySnapshot> getData() {
    return tblKategori.snapshots();
  }

  static Future<void> tambahData({required Kategori kategori}) async {
    DocumentReference docRef = tblKategori.doc(kategori.notelp);

    await docRef
        .set(kategori.toJson())
        .whenComplete(() => print("data berhasil diinput"))
        .catchError((e) => print(e));
  }
}

class DatabaseUser {
  static Stream<DocumentSnapshot> getData() {
    return tblUser.doc('notelp').snapshots();
  }

  static Future<void> tambahData({required User user}) async {
    DocumentReference docRef = tblUser.doc(user.notelp);

    await docRef
        .set(user.toJson())
        .whenComplete(() => print("data berhasil diinput"))
        .catchError((e) => print(e));
  }

  // static Future<void> getUserData() async {
  //   List userData = [];

  //   try {
  //     await tblHistory.get().then((QuerySnapshot) {
  //       QuerySnapshot.docs.forEach((element) {
  //         userData.add(element.data);
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

}
