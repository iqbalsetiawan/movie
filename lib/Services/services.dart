import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/Model/movie.dart';
import 'package:movie/Model/movie_detail.dart';

const String baseApi = 'https://api.themoviedb.org/3/movie';
const String apiKey = '06bb39946611129d31a32ad5c7083d5e';

class APIServices {
  Future<List<Movie>> getNowShowing() async {
    Uri uri = Uri.parse('$baseApi/now_playing?api_key=$apiKey');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Movie>> getUpcoming() async {
    Uri uri = Uri.parse('$baseApi/upcoming?api_key=$apiKey');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Movie>> getPopular() async {
    Uri uri = Uri.parse('$baseApi/popular?api_key=$apiKey');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieDetail>> getRecommended(int idMovie) async {
    Uri uri = Uri.parse('$baseApi/$idMovie/recommendations?api_key=$apiKey');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<MovieDetail> movies = data
          .where((movie) => movie['backdrop_path'] != null)
          .map((movie) => MovieDetail.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
