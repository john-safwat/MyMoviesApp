import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mymoviesapp/Data/Models/MovieResponse/MovieResponseDTO.dart';

class ApiManager {
  static ApiManager? _instance ;
  ApiManager._();

  static ApiManager getApiManager(){
    _instance ??= ApiManager._();
    return _instance!;
  }

  String baseUrl = 'yts.mx';

  var dio = Dio();

  Future<MovieResponseDTO> getHighRatingMovies()async{
    Uri url = Uri.https(
      baseUrl ,
      '/api/v2/list_movies.json',
      {
        'sort_by' : 'year' ,
        'genre' : 'SCI-FI '
      }
    );
    var response =await dio.get(url.toString());
    return MovieResponseDTO.fromJson(response.data);
  }

  Future<MovieResponseDTO> getMovieListByGenre( String genre , String page)async{
    Uri url = Uri.https(
        baseUrl ,
        '/api/v2/list_movies.json',
        {
          'sort_by' : 'year' ,
          'genre' : genre,
          'page' : page,
        }
    );
    var response =await dio.get(url.toString());
    return MovieResponseDTO.fromJson(response.data);
  }

  Future<MovieResponseDTO> gatSearchResults(String keyword)async{
    Uri url = Uri.https(
        baseUrl ,
        '/api/v2/list_movies.json',
        {
          'query_term' : keyword,
        }
    );
    var response =await dio.get(url.toString());
    return MovieResponseDTO.fromJson(response.data);
  }
}
