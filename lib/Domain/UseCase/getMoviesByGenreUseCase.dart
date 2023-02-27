import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

class GetMoviesByGenreUseCase{
  HomeDataRepository repository ;
  GetMoviesByGenreUseCase(this.repository);

  Future<List<Movies>?> doWork(String genre)async{
    List<Movies> movies = [];
    for (int i = 0 ; i<3 ; i++){
      var response = await repository.getMoviesByGenre(genre , i.toString());
      for(int j = 0 ; j<response!.length ;j++){
        movies.add(response[j]);
      }
    }
    for (int i =0 ; i< movies.length ; i++){
      if (movies[i].rating == 0 || movies[i].rating == null){
        movies.remove(movies[i]);
      }
    }
    return movies;
  }
}