class History {
  //Kategori digunakan untuk Pengeluaran atau Pendapatan saja
  final String Kategori;
  //subKategori digunakan untuk tipe kategori seperti pengeluaran untuk "makan" atau "minum". Pendapatan tidak ada subkategori
  final String subKategori;
  final String Nama;
  final String NoTelp;
  final int Nominal;
  final String TanggalTransaksi;

  History(
      {required this.Kategori,
      required this.subKategori,
      required this.Nama,
      required this.NoTelp,
      required this.Nominal,
      required this.TanggalTransaksi});

  Map<String, dynamic> toJson() {
    return {
      "Kategori": Kategori,
      "subKategori": subKategori,
      "Nama": Nama,
      "NoTelp": NoTelp,
      "Nominal": Nominal,
      "TanggalTransaksi": TanggalTransaksi
    };
  }

  factory History.fromJason(Map<String, dynamic> json) {
    return History(
        Kategori: json['Kategori'],
        subKategori: json['subKategori'],
        Nama: json['Nama'],
        NoTelp: json['NoTelp'],
        Nominal: json['Nominal'],
        TanggalTransaksi: json['TanggalTransaksi']);
  }
}
