part of 'userdetails_bloc.dart';

@immutable
sealed class UserdetailsState {}

final class UserdetailsInitial extends UserdetailsState {}

final class UserFetched extends UserdetailsState {
  final UserFetchModel2 model;

  UserFetched({required this.model});
}
