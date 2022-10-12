import 'dart:convert';

import 'package:flutter_application_movie/models/model_cast.dart';
import 'package:flutter_application_movie/models/model_detail.dart';
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

  Future<MovieDetailModel?> getMovie(int movieId) async {
    String _url =
        "$pathProduction/movie/$movieId?api_key=$apiKey&language=en-US";
    Uri _uri = Uri.parse(_url);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> movieMap = json.decode(response.body);
      MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(movieMap);
      return movieDetailModel;
    }
    return null;
  }

  Future<CastModel?> getCast(int movieId) async {
    String _url =
        "$pathProduction/movie/$movieId/credits?api_key=$apiKey&language=en-US";
    Uri _uri = Uri.parse(_url);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> castMap = json.decode(response.body);
      CastModel castmodel = CastModel.fromJson(castMap);
      return castmodel;
    }
    return null;
  }
}
