import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Presentation/Home/HomeScreenView.dart';
import 'package:dcdg/dcdg.dart';
import 'package:mymoviesapp/Presentation/Splash/SplashScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
      },
      initialRoute:SplashScreen.routeName  ,
      theme: MyTheme.theme,
    );
  }
}
