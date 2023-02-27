import 'package:flutter/widgets.dart';
import 'package:mymoviesapp/Data/API/ApiManager.dart';
import 'package:mymoviesapp/Data/DataSource/Home_Data_Remote_DataSource_Impl.dart';
import 'package:mymoviesapp/Data/Repository/Home_Data_Repository_Impl.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesDataUseCase.dart';
import 'package:mymoviesapp/Presentation/Home/di.dart';
class HomeTabViewModel extends ChangeNotifier {
  List<Movies>? movies ;
  String? errorMessage ;
  GetMoviesDataUseCase useCase ;
  HomeTabViewModel(this.useCase);

  Future<void> getTopRatedMovies() async{
    movies = null ;
    errorMessage = null ;
    try{
      movies = await useCase.doWork();
    }catch(e){
      errorMessage = "Network Error";
    }
    notifyListeners();
  }

}