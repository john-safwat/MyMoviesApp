import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Presentation/Home/Tabs/Home/Widgets/PosterImage.dart';

class TopRatedMovies extends StatefulWidget {
  List<Movies> movies;
  TopRatedMovies({required this.movies});
  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  String image = '';
  @override
  void initState() {
    super.initState();
    image = widget.movies[0].largeCoverImage!;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // image to show in the background it the same image of the poster
        CachedNetworkImage(
          imageUrl: image,
          width: MediaQuery.of(context).size.width,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: MyTheme.gold,)),
          errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: MyTheme.gold,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 500,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Icon(
                    Icons.error,
                    size: 40,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Image not Found",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  )
                ],
              )
          ),
        ),
        // gradient layer above the image
        Positioned.fill(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: double.infinity,//MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MyTheme.backGroundColor.withOpacity(1),
                  MyTheme.backGroundColor.withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
          ),
        ),
        // the poster list (the slider)
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Available Now.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              CarouselSlider(
                items: widget.movies.map((movie) => PosterImage(movie: movie)).toList(),
                options: CarouselOptions(
                  height:300,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {image = widget.movies[index].largeCoverImage!;});
                  },
                  autoPlayInterval: const Duration(seconds: 1),
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  enlargeFactor: 0.32,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Image.asset(
                'assets/images/Watch Now.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ],
          ),
        )
      ]
    );
  }
}
