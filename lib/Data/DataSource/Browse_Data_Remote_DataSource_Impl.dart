import 'package:mymoviesapp/Data/API/ApiManager.dart';
import 'package:mymoviesapp/Domain/Models/MovieResponse.dart';

import '../../Domain/Repository/Browse_Data_Contract.dart';

class BrowseDataRemoteDataSourceImpl implements BrowseDataRemoteDataSource{
  ApiManager apiManager;
  BrowseDataRemoteDataSourceImpl(this.apiManager);

  @override
  Future<MovieResponse> getBrowseData(String genre  , int pageNumber ) async{
    var response  = await apiManager.getMovieListByGenre(genre, pageNumber.toString());
    return response.toDomain();
  }

}