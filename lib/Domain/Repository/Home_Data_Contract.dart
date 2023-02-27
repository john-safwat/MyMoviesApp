import 'package:mymoviesapp/Domain/Models/MovieResponse.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';

abstract class HomeDataRepository {
  Future<List<Movies>?> getTopRatedMovies();
  Future<List<Movies>?> getMoviesByGenre(String genre ,  String page);
}

abstract class HomeDataRemoteDataSource {
  Future<MovieResponse> getTopRatedMovies ();
  Future<MovieResponse> getMoviesByGenre(String genre , String page);
}