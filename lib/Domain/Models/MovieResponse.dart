import 'package:mymoviesapp/Data/Models/MovieResponse/DataDTO.dart';

class MovieResponse {
  MovieResponse({
      this.status, 
      this.statusMessage, 
      this.data,
  });

  String? status;
  String? statusMessage;
  DataDTO? data;


}