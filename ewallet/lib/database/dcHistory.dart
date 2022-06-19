class History {
  final String tipeKategori;
  final String Nama;
  final String NoTelp;
  final int Nominal;

  History(
      {required this.tipeKategori,
      required this.Nama,
      required this.NoTelp,
      required this.Nominal});

  Map<String, dynamic> toJson() {
    return {
      "Kategori": tipeKategori,
      "Nama": Nama,
      "NoTelp": NoTelp,
      "Nominal": Nominal
    };
  }

  factory History.fromJason(Map<String, dynamic> json) {
    return History(
        tipeKategori: json['Kategori'],
        Nama: json['Nama'],
        NoTelp: json['NoTelp'],
        Nominal: json['Nominal']);
  }
}
