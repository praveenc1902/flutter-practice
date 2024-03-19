import 'package:movie_project_ca/domain/usecases/get_populat_movies.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movie_project_ca/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:bloc/bloc.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent,PopularMoviesState>{
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies}) : super(PopularMoviesInitial()){
    on<FetchPopularMovies>((event, emit) async {
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
      (failure) => emit(PopularMoviesError(message: failure.toString())),
      (movies) => emit(PopularMoviesLoaded(movies: movies)));
    }

    );
  }
  
}