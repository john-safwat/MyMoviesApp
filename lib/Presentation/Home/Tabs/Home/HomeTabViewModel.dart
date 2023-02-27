import 'package:flutter/widgets.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesByGenreUseCase.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesDataUseCase.dart';
class HomeTabViewModel extends ChangeNotifier {
  List<Movies>? movies ;
  List<Movies>? actionMovies ;
  String? errorMessage ;
  GetMoviesDataUseCase getMoviesDataUseCase ;
  GetMoviesByGenreUseCase getMoviesByGenreUseCase ;
  HomeTabViewModel(this.getMoviesDataUseCase , this.getMoviesByGenreUseCase);

  Future<void> getTopRatedMovies() async{
    movies = null ;
    errorMessage = null ;
    try{
      movies = await getMoviesDataUseCase.doWork();
    }catch(e){
      errorMessage = "Network Error";
    }
    notifyListeners();
  }

  Future<List<Movies>> getMoviesByGenre()async{
    actionMovies = null ;
    errorMessage = null ;
    try {
      actionMovies = await getMoviesByGenreUseCase.doWork("Action");
    }catch (e){
      errorMessage = "DataError";
    }
    notifyListeners();
    return actionMovies!;
  }

}