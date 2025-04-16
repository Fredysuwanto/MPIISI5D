import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/gempa.dart';

class GempaService {
  static const String url = 'https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json';

  static Future<Gempa> fetchGempa() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Gempa.fromJson(data['Infogempa']['gempa']);
    } else {
      throw Exception('Gagal mengambil data gempa');
    }
  }
}



