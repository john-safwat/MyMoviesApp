import 'package:flutter/material.dart';
import 'package:mymoviesapp/Presentation/Home/HomeScreenViewModel.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Browse/BrowseTabView.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/HomeTabView.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Profile/ProfileTabVIew.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Search/SearchTabView.dart';
import 'package:mymoviesapp/Presentation/Theme/Theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTabView() , SearchTabView(), BrowseTabView() , ProfileTabView() ];
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: tabs[selectedIndex],
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
