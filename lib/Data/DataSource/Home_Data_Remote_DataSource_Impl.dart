import 'package:mymoviesapp/Data/API/ApiManager.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

import '../../Domain/Models/MovieResponse.dart';

class HomeDataRemoteDataSourceImpl implements HomeDataRemoteDataSource{
  ApiManager apiManager;
  HomeDataRemoteDataSourceImpl(this.apiManager);

  @override
  Future<MovieResponse> getTopRatedMovies()async {
    var response = await apiManager.getHighRatingMovies();
    return response.toDomain();
  }

  @override
  Future<MovieResponse> getMoviesByGenre(String genre , String page) async{
    var response = await apiManager.getMovieListByGenre(genre , page);
    return response.toDomain();
  }

}