import 'package:flutter/widgets.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesByGenreUseCase.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesDataUseCase.dart';
class HomeTabViewModel extends ChangeNotifier {
  List<Movies>? movies ;
  List<Movies>? actionMovies ;
  List<Movies>? dramaMovies ;
  List<Movies>? crimeMovies ;
  List<Movies>? animationMovies ;
  String? errorMessage ;
  GetMoviesDataUseCase getMoviesDataUseCase ;
  GetMoviesByGenreUseCase getMoviesByGenreUseCase ;
  HomeTabViewModel(this.getMoviesDataUseCase , this.getMoviesByGenreUseCase);

  void readData() async {
    await getTopRatedMovies();
    await getDramaMovies();
    await getActionMovies();
    await getCrimeMovies();
    await getAnimationMovies();
    notifyListeners();
  }

  // get top rated movies
  Future<void> getTopRatedMovies() async{
    movies = null ;
    errorMessage = null ;
    try{
      movies = await getMoviesDataUseCase.doWork();
    }catch(e){
      errorMessage = "Network Error";
    }
  }

  // get drama movies
  Future<void> getDramaMovies()async{
    dramaMovies = null ;
    errorMessage = null ;
    try {
      dramaMovies = await getMoviesByGenreUseCase.doWork("Drama");
    }catch (e){
      errorMessage = e.toString();
    }
  }

  // get action movies
  Future<void> getActionMovies()async{
    actionMovies = null ;
    errorMessage = null ;
    try {
      actionMovies = await getMoviesByGenreUseCase.doWork("Action");
    }catch (e){
      errorMessage = e.toString();
    }
  }

  // get romantic movies
  Future<void> getCrimeMovies()async{
    crimeMovies = null ;
    errorMessage = null ;
    try {
      crimeMovies = await getMoviesByGenreUseCase.doWork("Crime");
    }catch (e){
      errorMessage = e.toString();
    }
  }

  // get animation movies
  Future<void> getAnimationMovies()async{
    animationMovies = null ;
    errorMessage = null ;
    try {
      animationMovies = await getMoviesByGenreUseCase.doWork("animation");
    }catch (e){
      errorMessage = e.toString();
    }
  }

}