import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Domain/UseCase/getMoviesByGenreToBrowseUseCase.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Browse/BrowseTabViewMode.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Browse/MovieWidget.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Browse/TabButton.dart';
import 'package:mymoviesapp/Presentation/Home/di.dart';
import 'package:provider/provider.dart';

class BrowseTabView extends StatefulWidget {
  @override
  State<BrowseTabView> createState() => _BrowseTabViewState();
}

class _BrowseTabViewState extends State<BrowseTabView> {
  List<String> genres = [
    'Action', 'Adventure', 'Animation', 'Biography', 'Comedy', 'Crime', 'Documentary', 'Drama',
    'Family', 'Fantasy', 'Film Noir', 'History', 'Horror', 'Music', 'Musical', 'Mystery', 'Romance',
    'Sci-Fi', 'Short Film', 'Sport', 'Superhero', 'Thriller', 'War', 'Western',
  ];
  int selectedIndex = 0;
  BrowseTabViewModel viewModel = BrowseTabViewModel(GetMoviesByGenreToBrowseUseCase(injectBrowseRepo()));

  @override
  void initState() {
    super.initState();
    viewModel.getMoviesByGenre(genres[selectedIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                length: genres.length,
                child: TabBar(
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorColor: Colors.transparent,
                  labelPadding: const EdgeInsets.all(5),
                  tabs: genres.map((item) => TabButton(genre: item, isSelected: genres.indexOf(item) == selectedIndex ,)).toList(),
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                      viewModel.getMoviesByGenre(genres[selectedIndex]);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child:Consumer <BrowseTabViewModel>(
                builder: (context, value, child) {
                  if (value.errorMessage != null){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(value.errorMessage! , style: const TextStyle(color: Colors.white),),
                        ElevatedButton(
                          onPressed: (){
                            value.getMoviesByGenre(genres[selectedIndex]);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(MyTheme.gold),
                          ) ,
                          child:const Text(
                            "Try Again"
                          )
                        )
                      ],
                    );
                  }
                  if (value.movies == null){
                    return const Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.gold,
                      ),
                    );
                  }else {
                    return ListView.builder(
                      itemBuilder: (context, index) => MovieWidget(value.movies![index]),
                      itemCount: value.movies!.length,
                    );
                  }
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
