import 'package:dartz/dartz.dart';
import 'package:movie_project_ca/core/errors/server_failures.dart';
import 'package:movie_project_ca/domain/entities/movie.dart';
import 'package:movie_project_ca/domain/repositories/movie_repository.dart';

class SearchMovies{
  final MovieRepository repository;

  SearchMovies({required this.repository});
  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }

}