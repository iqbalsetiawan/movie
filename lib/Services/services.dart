import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/Model/movie.dart';
import 'package:movie/Model/movie_detail.dart';
import 'package:movie/Config/api_config.dart';

class APIServices {
  Future<List<Movie>> getNowShowing() async {
    Uri uri = Uri.parse('${ApiConfig.baseApi}/now_playing?api_key=${ApiConfig.apiKey}');
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
    Uri uri = Uri.parse('${ApiConfig.baseApi}/upcoming?api_key=${ApiConfig.apiKey}');
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
    Uri uri = Uri.parse('${ApiConfig.baseApi}/popular?api_key=${ApiConfig.apiKey}');
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
    Uri uri = Uri.parse('${ApiConfig.baseApi}/$idMovie/recommendations?api_key=${ApiConfig.apiKey}');
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
