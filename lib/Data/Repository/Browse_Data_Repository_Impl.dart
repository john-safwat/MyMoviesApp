import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Browse_Data_Contract.dart';

class BrowseDataRepositoryImpl implements BrowseDataRepository {
  BrowseDataRemoteDataSource remoteDataSource;
  BrowseDataRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<Movies>> getBrowseData(String genre, int pageNumber) async{
    var response = await remoteDataSource.getBrowseData(genre, pageNumber);
    return response.data!.movies!.map((e) => e.toDomain()).toList();
  }

}