import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> instances = [];
    final url = Uri.parse('$baseUrl/popular');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> movies = jsonDecode(res.body);
      for (final movie in movies['results']) {
        instances.add(MovieModel.fromJson(movie));
      }
      return instances;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> instances = [];
    final url = Uri.parse('$baseUrl/now-playing');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> movies = jsonDecode(res.body);
      for (final movie in movies['results']) {
        instances.add(MovieModel.fromJson(movie));
      }
      return instances;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<MovieModel>> getUpcomingMovies() async {
    List<MovieModel> instances = [];
    final url = Uri.parse('$baseUrl/coming-soon');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> movies = jsonDecode(res.body);
      for (final movie in movies['results']) {
        instances.add(MovieModel.fromJson(movie));
      }
      return instances;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<MovieDetailModel> getMovieDetail(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> movie = jsonDecode(res.body);
      return MovieDetailModel.fromJson(movie);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
