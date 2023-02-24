import 'package:flutter/material.dart';
import 'package:mymoviesapp/Presentation/Home/HomeScreenViewModel.dart';
import 'package:mymoviesapp/Presentation/Theme/Theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items:const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "HOME"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: "SEARCH"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded),
                label: "BROWSE"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "HOME"
            ),
          ],
        ),
      ),
    );
  }
}
