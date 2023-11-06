import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fun_movies/Data/Model/movie.dart';

class MovieDetalScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetalScreen({super.key, required this.movie});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // title: Text(
        //   movie.originalTitle,
        //   style: const TextStyle(color: Colors.white),
        // ),
        background: Container(
          margin: const EdgeInsets.all(10),
          child: Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget moviInfo(/*String title,*/ String value) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: /*TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),*/
          TextSpan(
        text: value,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      //],
    );
    // );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.orange[200],
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        /*'original_title :', */ movie.originalTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      moviInfo(/*'Family :',*/ movie.releaseDate),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          moviInfo(
                              /*'Family :',*/ movie.voteAverage.toString()),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber.shade600,
                          )
                        ],
                      ),
                      //buildDivider(260),
                      // moviInfo(/*'original_language :',*/
                      //     movie.spokenLanguages.map((e) => e.name).toString()),
                      buildDivider(260),
                      const SizedBox(height: 10),
                      moviInfo(/*'Genres :',*/
                          movie.genres.map((e) => e.name).toString()),
                      buildDivider(260),
                      const SizedBox(height: 10),
                      const Text(
                        'Over View',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ExpandableText(
                            movie.overview,
                            animation: true,
                            style: const TextStyle(
                                color: Colors.white,
                                //       //fontWeight: FontWeight.bold,
                                fontSize: 16),
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 3,
                            linkColor: Colors.blue,
                          ),
                        ],
                      ),
                      // Text(
                      //   /*'overview :', */ movie.overview,
                      //   style: const TextStyle(
                      //       color: Colors.white,
                      //       //fontWeight: FontWeight.bold,
                      //       fontSize: 16),
                      // ),
                      const SizedBox(height: 10),
                      //  buildDivider(325),
                      moviInfo(/*'Family :',*/ movie.originalTitle),
                      buildDivider(300),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
