import 'package:movie_project_ca/domain/usecases/get_search_movies.dart';
import 'package:movie_project_ca/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:movie_project_ca/presentation/bloc/search_movies/search_movies_state.dart';
import 'package:bloc/bloc.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent,SearchMoviesState>{
  final SearchMovies searchMovies;
  final String query;

  SearchMoviesBloc({required this.query, required this.searchMovies}) : super(SearchMoviesInitial()){
    on<FetchSearchMovies>((event, emit) async {
      final failureOrMovies = await searchMovies(query);
      failureOrMovies.fold(
      (failure) => emit(SearchMoviesError(message: failure.toString())),
      (movies) => emit(SearchMoviesLoaded(movies: movies)));
    }
    );
  }
}