import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project_ca/injection_container.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movie_project_ca/presentation/pages/popular_movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
      child: PopularMoviesScreen(),),
    );
  }
}
