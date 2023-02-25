import 'package:mymoviesapp/Data/API/ApiManager.dart';
import 'package:mymoviesapp/Data/Models/MovieResponse/MovieResponse.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

class HomeDataRemoteDataSourceImpl implements HomeDataRemoteDataSource{
  ApiManager apiManager;
  HomeDataRemoteDataSourceImpl(this.apiManager);

  @override
  Future<MovieResponse> getTopRatedMovies()async {
    var response = await apiManager.getHighRatingMovies();
    return response;
  }

}