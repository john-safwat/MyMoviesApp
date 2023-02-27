import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

class GetMoviesByGenreUseCase{
  HomeDataRepository repository ;
  GetMoviesByGenreUseCase(this.repository);

  Future<List<Movies>?> doWork(String genre)async{
    var response = await repository.getMoviesByGenre(genre);
    return response;
  }
}