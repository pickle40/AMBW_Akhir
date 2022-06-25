import 'package:cloud_firestore/cloud_firestore.dart';

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

  static Future<List> getGroupedData(String noTelp) async {
    QuerySnapshot querySnapshot =
        await tblHistory.where("NoTelp", isEqualTo: noTelp).get();
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

  static Stream<QuerySnapshot> filterDataKategori({required String notelp}) {
    return tblKategori.where('notelp', isEqualTo: notelp).snapshots();
  }

  static Future<void> tambahData({required Kategori kategori}) async {
    DocumentReference docRef = tblKategori.doc();

    await docRef
        .set(kategori.toJson())
        .whenComplete(() => print("data berhasil diinput"))
        .catchError((e) => print(e));
  }

  static Future<List> getKategory() async {
    QuerySnapshot querySnapshot = await tblKategori.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }
}

class DatabaseUser {
  static Stream<QuerySnapshot> getData() {
    return tblUser.snapshots();
  }

  static Stream<QuerySnapshot> getDataPenerima(
      {required String notelpPenerima}) {
    return tblUser.where('Notelp', isEqualTo: notelpPenerima).snapshots();
  }

  static Stream<QuerySnapshot> getDataPengirim(
      {required String notelpPengirim}) {
    return tblUser.where('Notelp', isEqualTo: notelpPengirim).snapshots();
  }

  static Future<List> getUserData(String noTelp) async {
    QuerySnapshot querySnapshot =
        await tblUser.where('notelp', isEqualTo: noTelp).get();
    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
    return data;
  }

  static Future<void> updateData({required User data}) async {
    DocumentReference docRef = tblUser.doc(data.notelp);
    await docRef
        .update(data.toJson())
        .whenComplete(() => print("Data Berhasil Diubah!"))
        .catchError((e) => print(e));
  }

  // static Future<Stream<QuerySnapshot<Object?>>> login(
  //     {required final email, required final passcode}) async {
  //   Stream<QuerySnapshot> user = tblUser
  //       .where('email', isEqualTo: email)
  //       .where('passcode', isEqualTo: passcode)
  //       .snapshots();

  //   return user;
  // }

  // static Future<String> login(
  //     {required String email, required String passcode}) async {
  //   return tblUser
  //       .where('email', isEqualTo: email)
  //       .where('passcode', isEqualTo: passcode)
  //       .get()
  //       .toString();
  // }

  static Stream<QuerySnapshot> login(
      {required String email, required String passcode}) {
    return tblUser
        .where('email', isEqualTo: email)
        .where('passcode', isEqualTo: passcode)
        .snapshots();
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
