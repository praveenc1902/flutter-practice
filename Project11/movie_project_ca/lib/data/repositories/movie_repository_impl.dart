import 'package:dartz/dartz.dart';
import 'package:movie_project_ca/core/errors/server_exception.dart';
import 'package:movie_project_ca/core/errors/server_failures.dart';
import 'package:movie_project_ca/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_project_ca/data/models/movie_model.dart';
import 'package:movie_project_ca/domain/entities/movie.dart';
import 'package:movie_project_ca/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{
  final MovieRemoteDataSources remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure,List<Movie>>> getTrendingMovies() async {
    try{
      List<MovieModel> movieModels =  await remoteDataSource.getTrendingMovies();
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException{
      return Left(ServerFailure());
    }
    
  }

  @override
  Future<Either<Failure,List<Movie>>> popularMovies() async {

    try{
      List<MovieModel> movieModels =  await remoteDataSource.getPopularMovies();
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> searchMovies(String query) async {
    try{
      List<MovieModel> movieModels =  await remoteDataSource.searchMovies(query);
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException{
      return Left(ServerFailure());
    }
  }
  
}