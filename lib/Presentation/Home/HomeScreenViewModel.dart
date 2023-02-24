import 'package:flutter/material.dart';
import 'package:mymoviesapp/Data/DataSource/API/ApiManager.dart';
import 'package:mymoviesapp/Data/Models/MovieResponse/Movies.dart';
import 'package:mymoviesapp/Domain/Repository/HomeDataRepo/Implementation/Home_Data_Remote_DataSource_Impl.dart';
import 'package:mymoviesapp/Domain/Repository/HomeDataRepo/Implementation/Home_Data_Repository_Impl.dart';

import '../../Domain/Repository/HomeDataRepo/Home_Data_Contract.dart';

class HomeScreenViewModel extends ChangeNotifier{
  List<Movies>? movies ;
  String? errorMessage ;

  late ApiManager apiManager;
  late HomeDataRemoteDataSource remoteDataSource;
  late HomeDataRepository repository ;

  HomeScreenViewModel(){
    apiManager = ApiManager();
    remoteDataSource = HomeDataRemoteDataSourceImpl(apiManager);
    repository = HomeDataRepositoryImpl(remoteDataSource);
  }

  Future<void> getTopRatedMovies() async{
    movies = null ;
    errorMessage = null ;
    try{
      movies = await repository.getTopRatedMovies();
      notifyListeners();
    }catch(e){
      errorMessage = "Network Error";
    }
  }

}