import 'dart:convert';

import 'package:flutter_application_movie/models/movie.dart';
import 'package:flutter_application_movie/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIservices {
  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> movies = [];
    String _url =
        "$pathProduction/discover/movie?api_key=$apiKey&language=en-US&page=2";
    Uri _uri = Uri.parse(_url);
    http.Response _reponse = await http.get(_uri);
    if (_reponse.statusCode == 200) {
      Map<String, dynamic> moviMap = json.decode(_reponse.body);
      movies = moviMap["results"]
          .map<MovieModel>((e) => MovieModel.fromJson(e))
          .toList();
      return movies;
    } else {
      return movies;
    }
  }
}
