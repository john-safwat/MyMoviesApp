import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

class GetMoviesByGenreUseCase{
  HomeDataRepository repository ;
  GetMoviesByGenreUseCase(this.repository);

  Future<List<Movies>?> doWork(String genre)async{
    var response = await repository.getMoviesByGenre(genre);
    for (int i =0 ; i< response!.length ; i++){
      if (response[i].largeCoverImage == null){
        response.remove(response[i]);
      }
    }
    return response;
  }
}