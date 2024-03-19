import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_project_ca/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_project_ca/data/datasources/remote/movie_remote_data_sources_impl.dart';
import 'package:movie_project_ca/data/repositories/movie_repository_impl.dart';
import 'package:movie_project_ca/domain/repositories/movie_repository.dart';
import 'package:movie_project_ca/domain/usecases/get_populat_movies.dart';
import 'package:movie_project_ca/domain/usecases/get_search_movies.dart';
import 'package:movie_project_ca/domain/usecases/get_trending_movies.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_project_ca/presentation/bloc/trending_movies/trending_movies_bloc.dart';

final getIt = GetIt.instance;

void init(){
  //Bloc 
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMovies(repository: getIt()));

  //Usecases
  getIt.registerLazySingleton(() => GetPopularMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(repository:getIt()));
  getIt.registerLazySingleton(() => SearchMovies(repository: getIt()));

  //Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));

  //Data Sources
  getIt.registerLazySingleton<MovieRemoteDataSources>(() => MovieRemoteDataSourcesImpl(client: getIt()));

  //Http Service
  getIt.registerLazySingleton(() => http.Client());
}

