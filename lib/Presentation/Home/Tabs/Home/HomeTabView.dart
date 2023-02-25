import 'package:flutter/material.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/HomeTabViewModel.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/TopRatedMovies/TopRatedMovies.dart';
import 'package:mymoviesapp/Presentation/Theme/Theme.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeTabViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
            return Center(
              child: Text(
                value.errorMessage!,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          if (value.movies == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.gold,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  TopRatedMovies(movies: value.movies!),

                ],
              )
            );
          }
        },
      ),
    );
  }
}