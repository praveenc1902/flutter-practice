
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:movie_project_ca/presentation/pages/movies_list.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<PopularMoviesBloc,PopularMoviesState>(
        builder: (context, state) {
          if(state is PopularMoviesLoading){
            return CircularProgressIndicator();
          }
          else if(state is PopularMoviesLoaded){
            return MoviesList(movies: state.movies);
          }
          else if (state is PopularMoviesError){
            return Text(state.message);
          }
          return Container();
        },
      )
    );
  }
}