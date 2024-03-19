import 'package:movie_project_ca/domain/entities/movie.dart';

abstract class SearchMoviesState{}

class SearchMoviesInitial extends SearchMoviesState{}

class SearchMoviesLoading extends SearchMoviesState{}

class SearchMoviesLoaded extends SearchMoviesState{
  final List<Movie> movies;

  SearchMoviesLoaded({required this.movies});
}

class SearchMoviesError extends SearchMoviesState{
  final String message;

  SearchMoviesError({required this.message});
}

