import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/Widgets/PosterImage.dart';

class Movieslist extends StatelessWidget {
  List<Movies> movies;
  String type;
  Movieslist({required this.movies , required this.type });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // the title of the genre
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              type,
              textAlign: TextAlign.start,
              style:const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // the movies
          CarouselSlider(
            items: movies.map((movie) => PosterImage(movie: movie)).toList(),
            options: CarouselOptions(
              height: 220,
              viewportFraction: 0.32,
              initialPage: 5,
              autoPlayInterval: const Duration(seconds: 1),
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlay: false,
              enlargeFactor: 0.32,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

