import 'package:mymoviesapp/Data/Models/MovieResponse/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/HomeDataRepo/Home_Data_Contract.dart';
import 'Home_Data_Remote_DataSource_Impl.dart';

class HomeDataRepositoryImpl implements HomeDataRepository {
  HomeDataRemoteDataSource remoteDataSource ;
  HomeDataRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movies>?> getTopRatedMovies() async{
    var response =await  remoteDataSource.getTopRatedMovies();
    return response.data?.movies;
  }

}