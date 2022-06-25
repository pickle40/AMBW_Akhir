class User {
  final String alamat;
  final String email;
  final String nama;
  final String norek;
  final String notelp;
  final int uang;
  final String passcode;

  User(
      {required this.alamat,
      required this.email,
      required this.nama,
      required this.norek,
      required this.notelp,
      required this.uang,
      required this.passcode});

  Map<String, dynamic> toJson() {
    return {
      "alamat": alamat,
      "email": email,
      "nama": nama,
      "norek": norek,
      "notelp": notelp,
      "uang": uang,
      "passcode": passcode
    };
  }

  factory User.fromJason(Map<String, dynamic> json) {
    return User(
        alamat: json['alamat'],
        email: json['email'],
        nama: json['nama'],
        norek: json['norek'],
        notelp: json['notelp'],
        uang: json['uang'],
        passcode: json['passcode']);
  }
}
