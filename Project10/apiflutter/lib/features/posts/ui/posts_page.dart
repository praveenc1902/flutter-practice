import 'package:apiflutter/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts Page"),
          backgroundColor: Colors.blue,
        ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        postsBloc.add(PostsAddEvent());
      },

    ),
    body: BlocConsumer<PostsBloc, PostsState>(
      bloc: postsBloc,
      listenWhen: (previous,current)=>current is PostsActionSate,
      buildWhen: (previous,current) => current is !PostsActionSate,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case PostsFetchingLoadingState:
            return Center(
              child: CircularProgressIndicator(),
            );
          case PostFetchingSuccessful:
            final successState = state as PostFetchingSuccessful;

            return ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context,index){
                  return Container(
                    color: Colors.grey,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(successState.posts[index].body)
                      ],
                    ),
                  );
                });
          default:
            return SizedBox(height: 20,);
        }
      return Container(

      );
    }
    ),
    );
  }
}
