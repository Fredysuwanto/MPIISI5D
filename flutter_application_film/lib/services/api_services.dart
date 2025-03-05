import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = "https:/api.themoviedb.org/3";
  static const apikey = "46b4c6dea3acc41afb66289a695bc58";

  Future<List<Map<String, dynamic>>> getAllMovie() async{
    final Response = await http.get(Uri.parse("$baseUrl/movie/now_paying?api_key=$apikey"));
    final data = json.decode(Response.body);

    return List<Map<String, dynamic>>.from(data['results']);
  }
  Future<List<Map<String, dynamic>>> getTrendingMovies() async{
    final Response = await http.get(Uri.parse("$baseUrl/movie/now_paying?api_key=$apikey"));
    final data = json.decode(Response.body);

    return List<Map<String, dynamic>>.from(data['results']);
  }

  getPopularMovies() {}

  
}
