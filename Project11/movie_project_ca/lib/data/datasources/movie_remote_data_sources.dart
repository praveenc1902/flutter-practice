import 'package:movie_project_ca/data/models/movie_model.dart';

abstract class MovieRemoteDataSources{
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<MovieModel>> getPopularMovies();

}