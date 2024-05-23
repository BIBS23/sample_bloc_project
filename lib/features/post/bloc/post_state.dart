part of 'post_bloc.dart';

sealed class PostState {}

final class PostInitial extends PostState {}

class LoadingState extends PostState{}

class PostFetchingSuccessfull extends PostState {
  List<PostDataModel> post = [];
  PostFetchingSuccessfull({
    required this.post,
  });
}
