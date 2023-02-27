import 'package:flutter/material.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesByGenreUseCase.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesDataUseCase.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/HomeTabViewModel.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/Widgets/MoviesLists.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/Widgets/TopRatedMovies.dart';
import 'package:mymoviesapp/Presentation/Home/di.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewModel viewModel = HomeTabViewModel(
    GetMoviesDataUseCase(injectHomeDataRepo()),
    GetMoviesByGenreUseCase(injectHomeDataRepo())
  );
  @override
  void initState() {
    super.initState();
    viewModel.readData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeTabViewModel>(
        builder: (context, value, child) {
          // cheek if there in an error
          if (value.errorMessage != null) {
            return Center(
              child: Text(
                value.errorMessage!,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          // waiting for data response
          if (value.movies == null
              || value.actionMovies == null
              || value.animationMovies == null
              || value.crimeMovies == null
              || value.dramaMovies == null
          ) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.gold,
              ),
            );
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopRatedMovies(movies: value.movies!),
                    const SizedBox(height: 20,),
                    Movieslist(movies: value.actionMovies! , type: "Action Movies",),
                    Movieslist(movies: value.crimeMovies! , type: "Crime Movies  ",),
                    Movieslist(movies: value.dramaMovies! , type: "Drama Movies",),
                    Movieslist(movies: value.animationMovies! , type: "Animation Movies",),
                  ],
                )
              ),
            );
          }
        },
      ),
    );
  }
}
