import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "46b4cd6dea3acc41afb66289a695bc58";

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final Response = 
    await  http.get(Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"));

    final data = json.decode(Response.body);

    return List<Map<String, dynamic>>.from(data["results"]);
  }

   Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final Response = 
    await  http.get(Uri.parse("$baseUrl/movie/week?api_key=$apiKey"));

    final data = json.decode(Response.body);

    return List<Map<String, dynamic>>.from(data["results"]);
  }

   Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final Response = 
    await  http.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));

    final data = json.decode(Response.body);

    return List<Map<String, dynamic>>.from(data["results"]);
  }
}

