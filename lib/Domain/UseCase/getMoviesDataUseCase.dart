import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

class GetMoviesDataUseCase {
  HomeDataRepository repository;
  GetMoviesDataUseCase(this.repository);

  Future<List<Movies>?> doWork() async{
    var response = await repository.getTopRatedMovies();
    return response;
  }

}