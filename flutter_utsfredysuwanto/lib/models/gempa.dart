class Gempa {
  final String tanggal;
  final String jam;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;

  Gempa({
    required this.tanggal,
    required this.jam,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
  }); 

  factory Gempa.fromJson(Map<String, dynamic> json) {
    return Gempa(
      tanggal: json['Tanggal'],
      jam: json['Jam'],
      lintang: json['Lintang'],
      bujur: json['Bujur'],
      magnitude: json['Magnitude'],
      kedalaman: json['Kedalaman'],
      wilayah: json['Wilayah'],
      potensi: json['Potensi'],
      dirasakan: json['Dirasakan']
    );
  }
}
