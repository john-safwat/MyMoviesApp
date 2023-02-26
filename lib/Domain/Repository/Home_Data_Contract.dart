import 'package:mymoviesapp/Domain/Models/MovieResponse.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';

abstract class HomeDataRepository {
  Future<List<Movies>?> getTopRatedMovies();
}

abstract class HomeDataRemoteDataSource {
  Future<MovieResponse> getTopRatedMovies ();
}