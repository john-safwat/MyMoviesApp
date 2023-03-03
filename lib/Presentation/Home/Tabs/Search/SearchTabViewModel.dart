import 'package:flutter/cupertino.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Domain/UseCase/getSearchResultsUseCase.dart';

class SearchTabViewModel extends ChangeNotifier {
  List<Movies>? movies ;
  String? errorMessage ;
  GetSearchResultsUseCase useCase ;

  SearchTabViewModel(this.useCase);

  Future<void> getSearchResults(String keyword)async{
    movies = null ;
    errorMessage = null ;
    try{
      if (keyword == 'الراجل اللي يا بختة'){
        var response = await useCase.getSearchResults('iron man');
        movies = response;
      }else {
        var response = await useCase.getSearchResults(keyword);
        movies = response;
      }
      notifyListeners();

    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

}