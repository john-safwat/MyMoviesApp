import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

class HomeDataRepositoryImpl implements HomeDataRepository {
  HomeDataRemoteDataSource remoteDataSource ;
  HomeDataRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movies>?> getTopRatedMovies() async{
    var response =await  remoteDataSource.getTopRatedMovies();

    return response.data?.movies?.map((e) => e.toDomain()).toList();
  }

}