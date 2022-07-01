class Kategori {
  final String Nama;
  final String notelp;
  // final int jumData;

  Kategori({required this.Nama, required this.notelp});

  Map<String, dynamic> toJson() {
    return {"Nama": Nama, "notelp": notelp};
  }

  factory Kategori.fromJason(Map<String, dynamic> json) {
    return Kategori(Nama: json['Nama'], notelp: json['notelp']);
  }
}
