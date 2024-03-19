import 'package:movie_project_ca/domain/entities/movie.dart';

abstract class TrendingMoviesState{}

class TrendingMoviesInitial extends TrendingMoviesState{}

class TrendingMoviesLoading extends TrendingMoviesState{}

class TrendingMoviesLoaded extends TrendingMoviesState{
  final List<Movie> movies;

  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesError extends TrendingMoviesState{
  final String message;

  TrendingMoviesError({required this.message});
}

