import 'package:mymoviesapp/Data/API/ApiManager.dart';
import 'package:mymoviesapp/Data/DataSource/Browse_Data_Remote_DataSource_Impl.dart';
import 'package:mymoviesapp/Data/DataSource/Home_Data_Remote_DataSource_Impl.dart';
import 'package:mymoviesapp/Data/DataSource/Search_Data_Remote_DataSource_Impl.dart';
import 'package:mymoviesapp/Data/Repository/Browse_Data_Repository_Impl.dart';
import 'package:mymoviesapp/Data/Repository/Home_Data_Repository_Impl.dart';
import 'package:mymoviesapp/Data/Repository/Search_Data_Repository_Impl.dart';
import 'package:mymoviesapp/Domain/Repository/Browse_Data_Contract.dart';
import 'package:mymoviesapp/Domain/Repository/Home_Data_Contract.dart';
import 'package:mymoviesapp/Domain/Repository/Search_Data_Contract.dart';

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

SearchDataRemoteDataSource getSearchDataRemoteDataSource(ApiManager apiManager){
  return SearchDataRemoteDataSourceImpl(apiManager);
}

SearchDataRepository getSearchDataRepository( SearchDataRemoteDataSource remoteDataSource){
  return SearchDataRepositoryImpl(remoteDataSource);
}

SearchDataRepository injectSearchRepo(){
  return getSearchDataRepository(getSearchDataRemoteDataSource(getApiManager()));
}

BrowseDataRemoteDataSource gatBrowseDataRemoteDataSource (ApiManager apiManager){
  return BrowseDataRemoteDataSourceImpl(apiManager);
}

BrowseDataRepository gatBrowseDataRepository (BrowseDataRemoteDataSource remoteDataSource){
  return BrowseDataRepositoryImpl(remoteDataSource);
}

BrowseDataRepository injectBrowseRepo (){
  return gatBrowseDataRepository(gatBrowseDataRemoteDataSource(getApiManager()));
}

