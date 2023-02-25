import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymoviesapp/Data/Models/MovieResponse/Movies.dart';
import 'package:mymoviesapp/Presentation/Theme/Theme.dart';
import 'package:swipe_deck/swipe_deck.dart';

class TopRatedMovies extends StatelessWidget {
  List<Movies> movies;
  TopRatedMovies({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // the highlight in the background
        Image.asset('assets/images/goldenshadow.png',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // this container contain the cards and the title
        Container(
            height: 335,
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // the title
                const Text(
                  "Nobody Does It Like Movie",
                  style: TextStyle(
                      fontSize: 26  ,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SwipeDeck(
                  startIndex: 4,
                  emptyIndicator: const Center(
                    child: Text("Nothing Here"),
                  ),
                  cardSpreadInDegrees: 5, // Change the Spread of Background Cards
                  onChange: (index) {
                    debugPrint(movies[index].title);
                  },
                  // the cards
                  widgets: movies.map((e) =>
                      Image.network(
                        e.largeCoverImage!,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                e.largeCoverImage!,
                                fit: BoxFit.fitWidth,
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: MyTheme.gold,
                              ),
                            );
                          }
                        },
                      )
                  ).toList(),
                ),
              ],
            )
        ),
      ]
    );
  }
}
