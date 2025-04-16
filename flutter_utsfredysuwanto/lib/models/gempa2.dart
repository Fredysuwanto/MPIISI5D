class Gempa2 {
  final String tanggal;
  final String jam;
  final String datetime;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;

  Gempa2({
    required this.tanggal,
    required this.jam,
    required this.datetime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
  }); 

  factory Gempa2.fromJson(Map<String, dynamic> json) {
    return Gempa2(
      tanggal: json['Tanggal'],
      jam: json['Jam'],
      datetime: json['Datetime'],
      coordinates: json['Coordinates'],
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
