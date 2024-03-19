import 'package:movie_project_ca/domain/usecases/get_trending_movies.dart';
import 'package:movie_project_ca/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:movie_project_ca/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:bloc/bloc.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent,TrendingMoviesState>{
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies}) : super(TrendingMoviesInitial()){
    on<FetchTrendingMovies>((event, emit) async {
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold((failure) => emit(TrendingMoviesError(message: failure.toString())),
      (movies) => emit(TrendingMoviesLoaded(movies: movies)));
    }

    );
  }
  
}