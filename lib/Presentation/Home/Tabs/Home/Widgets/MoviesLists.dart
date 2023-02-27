import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.32,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  Movies movie;
  PosterImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: movie.largeCoverImage!,
      imageBuilder: (context, imageProvider) => Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(movie.largeCoverImage!),
        ),
      ]),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: MyTheme.gold,
      )),
      errorWidget: (context, url, error) => const SizedBox(
          width: 120,
          child: Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          )),
    );
  }
}
