import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Search_Data_Contract.dart';

class SearchDataRepositoryImpl implements SearchDataRepository{
  SearchDataRemoteDataSource remoteDataSource ;
  SearchDataRepositoryImpl(this.remoteDataSource);

  @override
    Future<List<Movies>?>getMoviesByKeyWord(String keyword) async{
      var response =  await remoteDataSource.getMoviesByKeyWord(keyword);
      return response.data?.movies?.map((e) => e.toDomain()).toList();
    }

}