// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class FetchPostEvent extends PostEvent {}


