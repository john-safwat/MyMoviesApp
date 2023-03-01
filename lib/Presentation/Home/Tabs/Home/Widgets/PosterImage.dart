
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';

class PosterImage extends StatelessWidget {
  Movies movie;
  PosterImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    // show the image and handel the waiting state and error state
    return CachedNetworkImage(
      imageUrl: movie.largeCoverImage!,
      imageBuilder: (context, imageProvider) => Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(movie.largeCoverImage!),
        ),
      ]),
      placeholder: (context, url) => Image.asset('assets/images/loading.jpg'),
      errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: MyTheme.gold,
            borderRadius: BorderRadius.circular(10),
          ),
          height: double.infinity,
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
    );
  }
}