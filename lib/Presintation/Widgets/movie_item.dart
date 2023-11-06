// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fun_movies/Constants/strings.dart';
import 'package:fun_movies/Data/Apis/movie_apis.dart';
import 'package:fun_movies/Data/Model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, movieDetalScreen, arguments: movie),
        child: GridTile(
          footer: Hero(
            tag: movie.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                movie.originalTitle,
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            //color: Colors.black,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: movie.posterPath.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/b.gif',
                    image:
                        'https://image.tmdb.org/t/p/original${movie.posterPath}',
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/empty.gif'),
          ),
        ),
      ),
    );
  }
}
