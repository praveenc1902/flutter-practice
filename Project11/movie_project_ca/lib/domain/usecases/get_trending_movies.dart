import 'package:dartz/dartz.dart';
import 'package:movie_project_ca/core/errors/server_failures.dart';
import 'package:movie_project_ca/domain/entities/movie.dart';
import 'package:movie_project_ca/domain/repositories/movie_repository.dart';

class GetTrendingMovies{
  final MovieRepository repository;

  GetTrendingMovies({required this.repository});

  Future<Either<Failure, List<Movie>>> call() async{
    return await repository.getTrendingMovies();
  }

}