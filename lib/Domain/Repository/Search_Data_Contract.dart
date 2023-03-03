import '../Models/MovieResponse.dart';
import '../Models/Movies.dart';

abstract class SearchDataRepository {
  Future<List<Movies>?> getMoviesByKeyWord(String keyword );
}

abstract class SearchDataRemoteDataSource {
  Future<MovieResponse> getMoviesByKeyWord(String keyword);
}