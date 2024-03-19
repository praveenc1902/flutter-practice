import 'package:dartz/dartz.dart';
import 'package:movie_project_ca/core/errors/server_failures.dart';
import 'package:movie_project_ca/domain/entities/movie.dart';

abstract class MovieRepository{
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> searchMovies(String query);
  Future<Either<Failure,List<Movie>>> popularMovies();
}