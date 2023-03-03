import 'package:mymoviesapp/Domain/Models/MovieResponse.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';

abstract class BrowseDataRepository {
  Future<List<Movies>> getBrowseData(String genre , int pageNumber);
}

abstract class BrowseDataRemoteDataSource {
  Future<MovieResponse> getBrowseData(String genre , int pageNumber);
}