part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionSate extends PostsState{}

class PostsInitial extends PostsState {}

class PostsFetchingLoadingState extends PostsState{}

class PostsFetchingErrorState extends PostsState{}


class PostFetchingSuccessful extends PostsState{
  final List<PostsDataUIModel> posts;
  PostFetchingSuccessful({required this.posts});
}

class PostsAdditionSuccessState extends PostsActionSate{}

class PostsAdditionErrorState extends PostsActionSate{}