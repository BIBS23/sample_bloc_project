import 'package:flutter/material.dart';
import 'package:SampleBlocProject/features/post/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  PostBloc postBloc = PostBloc();
  @override
  void initState() {
    super.initState();
    postBloc.add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample bloc Project"),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case PostFetchingSuccessfull:
              final successState = state as PostFetchingSuccessfull;
              return ListView.builder(
                itemCount: successState.post.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                      )
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successState.post[index].title),
                        SizedBox(height: 25),
                        Text(
                          successState.post[index].body,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  );
                },
              );

            default:
              SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
