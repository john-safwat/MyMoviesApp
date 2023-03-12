import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Presentation/Home/HomeScreenView.dart';
import 'package:dcdg/dcdg.dart';
import 'package:mymoviesapp/Presentation/Intro/IntroScreenView.dart';
import 'package:mymoviesapp/Presentation/Login/LoginScreen.dart';
import 'package:mymoviesapp/Presentation/Splash/SplashScreen.dart';
import 'package:mymoviesapp/Presentation/Welcome/WelcomeScreen.dart';

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
        IntroScreenView.routeName :(_) => IntroScreenView(),
        WelcomeScreen.routeName :(_) => WelcomeScreen(),
        LoginScreen.routeName :(_) => LoginScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
      },
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: SplashScreen(),
        nextScreen: IntroScreenView(),
        splashIconSize: double.infinity,
        backgroundColor: Colors.white
      ),
      theme: MyTheme.theme,
    );
  }
}
