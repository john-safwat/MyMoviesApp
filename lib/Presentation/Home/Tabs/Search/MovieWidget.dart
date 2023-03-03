import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Core/Theme/Theme.dart';
import 'package:mymoviesapp/Domain/Models/Movies.dart';

class MovieWidget extends StatelessWidget {
  Movies movie ;
  MovieWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: MyTheme.blackThree,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          // the image
          CachedNetworkImage(
              imageUrl: movie.largeCoverImage!,
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.largeCoverImage!,
                  height: 200,
                ),
              ),
              placeholder: (context, url) =>  ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/loading.jpg',
                  height: 200,
                ),
              )
          ),
          // the details
          Expanded(
            child: Container(
              padding:const EdgeInsets.all(15),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // the title
                  Text(
                    movie.title!,
                    style:const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // the rating
                  Row(
                    children: [
                      const Icon(Icons.star_rate_rounded , color: MyTheme.gold, size: 30,),
                      Text(
                        "${ movie.rating!}/10",
                        style:const TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                  // the play time
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined , color: MyTheme.gold, size: 30,),
                      Text(
                        movie.runtime!.toString(),
                        style:const TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                  // button to navigate to the details bar
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1100),
                    ),
                    child: ElevatedButton(
                      onPressed: (){

                      },
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.gold),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                      ),
                      child: const Text(
                        "View",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
