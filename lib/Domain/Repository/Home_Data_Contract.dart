import 'package:mymoviesapp/Data/Models/MovieResponse/MovieResponse.dart';
import 'package:mymoviesapp/Data/Models/MovieResponse/Movies.dart';

abstract class HomeDataRepository {
  Future<List<Movies>?> getTopRatedMovies();
}

abstract class HomeDataRemoteDataSource {
  Future<MovieResponse> getTopRatedMovies ();
}