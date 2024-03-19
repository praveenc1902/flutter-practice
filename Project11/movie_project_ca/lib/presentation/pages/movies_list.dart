
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context,index){
        final movie = movies[index];
        return ListTile(
          leading: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(movie.title),
          subtitle: Text(movie.overview),
          onTap: (){
          },
        );
      });
  }
}