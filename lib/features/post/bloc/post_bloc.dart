import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:SampleBlocProject/features/post/models/post_data_model.dart';
import 'package:SampleBlocProject/features/post/repos/post_repo.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPostEvent>(fetchPostEvent);
  }

  FutureOr<void> fetchPostEvent(
      FetchPostEvent event, Emitter<PostState> emit) async {
    emit(LoadingState());
    List<PostDataModel> posts = await PostRepo.fetchPost();
    emit(PostFetchingSuccessfull(post: posts));
  }
}
