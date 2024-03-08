import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:apiflutter/features/posts/models/post_data_ui_model.dart';
import 'package:apiflutter/features/posts/repos/posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostsAddEvent>(postsAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(PostsInitialFetchEvent event, Emitter<PostsState> emit)  async {
    emit(PostsFetchingLoadingState());
    try {
      List<PostsDataUIModel> posts =  await PostsRepo.fetchPosts();
      print(posts);
      emit(PostFetchingSuccessful(posts: posts));
    } catch(e){
      emit(PostsFetchingLoadingState());
      log(e.toString());
    }

  }

  FutureOr<void> postsAddEvent(PostsAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPosts();
    if(success) {
      emit(PostsAdditionSuccessState());
    }else{
      emit(PostsAdditionErrorState());
    }
  }
}
