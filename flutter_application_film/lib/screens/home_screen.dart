import 'package:flutter/material.dart';
import 'package:flutter_application_film/models/movie.dart';
import 'package:flutter_application_film/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices apiServices = ApiServices();
  List<Movie> _allMovie = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  Future<void> _loadMovies() async{
    final List<Map<String, dynamic>> allMovieData = await apiServices.getAllMovie();
    final List<Map<String, dynamic>> trendingMoviesData = await apiServices.getTrendingMovies();
    final List<Map<String, dynamic>> popularMoviesData = await apiServices.getPopularMovies();

    setState(() {
      _allMovie = allMovieData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovies = trendingMoviesData.map((e) => Movie.fromJson(e)).toList();
      _popularMovies = popularMoviesData.map((e) => Movie.fromJson(e)).toList();
      
    });

  }
  @override
  void initState(){
    super.initState();
        _loadMovies();
  }
  Widget _buildMoviesListInterface(String title, List<Movie> movies){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
            final Movie movie = movies[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 5,),
                  Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            );
          })
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film'),
      ),
      body: Column(
        children: [
          _buildMoviesListInterface('All Movies', _allMovie)
        ],
      ),
    );
  }
}