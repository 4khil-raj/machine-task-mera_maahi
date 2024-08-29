part of 'userdetails_bloc.dart';

@immutable
sealed class UserdetailsEvent {}

final class FetchUserDetails extends UserdetailsEvent {}
