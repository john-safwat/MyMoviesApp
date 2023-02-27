import 'dart:convert';

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

  Future<MovieResponseDTO> getHighRatingMovies()async{
    Uri url = Uri.https(
      baseUrl ,
      '/api/v2/list_movies.json',
      {
        'sort_by' : 'year' ,
        'genre' : 'Animation '
      }
    );
    var response = await http.get(url);
    return MovieResponseDTO.fromJson(jsonDecode(response.body));
  }

}
