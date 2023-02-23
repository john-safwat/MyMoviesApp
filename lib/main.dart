import 'package:flutter/material.dart';
import 'package:mymoviesapp/Presentation/Home/HomeScreenView.dart';
import 'package:mymoviesapp/Presentation/Theme/Theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
      },
      initialRoute:HomeScreen.routeName ,
      theme: MyTheme.theme,
    );
  }
}
