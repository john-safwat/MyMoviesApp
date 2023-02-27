import 'package:mymoviesapp/Data/API/ApiManager.dart';
import 'package:mymoviesapp/Data/DataSource/Home_Data_Remote_DataSource_Impl.dart';
import 'package:mymoviesapp/Data/Repository/Home_Data_Repository_Impl.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';

ApiManager getApiManager (){
  return ApiManager.getApiManager();
}

HomeDataRemoteDataSource getHomeDataRemoteDataSource(ApiManager apiManager){
  return HomeDataRemoteDataSourceImpl(apiManager);
}

HomeDataRepository getHomeDateRepository (HomeDataRemoteDataSource remoteDataSource){
  return HomeDataRepositoryImpl(remoteDataSource);
}

HomeDataRepository injectHomeDataRepo(){
  return getHomeDateRepository(getHomeDataRemoteDataSource(getApiManager()));
}