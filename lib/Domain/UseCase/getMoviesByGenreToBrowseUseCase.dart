import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Browse_Data_Contract.dart';

class GetMoviesByGenreToBrowseUseCase {
  BrowseDataRepository repository;
  GetMoviesByGenreToBrowseUseCase(this.repository);

  Future<List<Movies>> getMoviesToBrowse(String genre )async{
    List<Movies> movies = [];
    for (int i =0 ; i < 6 ;i++){
      var response = await repository.getBrowseData(genre, i);
      for(int j = 0 ;j<response.length ;j++){
        movies.add(response[j]);
      }
    }
    return movies;
  }

}