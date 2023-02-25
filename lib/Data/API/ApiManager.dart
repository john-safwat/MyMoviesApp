import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mymoviesapp/Data/Models/MovieResponse/MovieResponse.dart';

class ApiManager {
  String baseUrl = 'yts.mx';

  Future<MovieResponse> getHighRatingMovies()async{
    Uri url = Uri.https(
      baseUrl ,
      '/api/v2/list_movies.json',
      {
        'sort_by' : 'year' ,
        'genre' : 'Animation '
      }
    );
    var response = await http.get(url);
    return MovieResponse.fromJson(jsonDecode(response.body));
  }

}
