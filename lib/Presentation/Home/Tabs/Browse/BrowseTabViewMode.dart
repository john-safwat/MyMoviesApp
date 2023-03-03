import 'package:flutter/cupertino.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesByGenreToBrowseUseCase.dart';

class BrowseTabViewModel extends ChangeNotifier {
  GetMoviesByGenreToBrowseUseCase useCase ;
  BrowseTabViewModel(this.useCase);

  String? errorMessage ;
  List<Movies>? movies ;

  Future<void> getMoviesByGenre(String genre)async{
    errorMessage = null;
    movies = null;
    try {
      var response = await useCase.getMoviesToBrowse(genre);
      movies = response ;
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
    }
  }

}