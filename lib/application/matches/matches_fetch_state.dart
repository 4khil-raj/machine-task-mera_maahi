part of 'matches_fetch_bloc.dart';

@immutable
sealed class MatchesFetchState {}

final class MatchesFetchInitial extends MatchesFetchState {}

final class MatchesFetchSuccessState extends MatchesFetchState {
  final List<MatchesFetchModel> list;

  MatchesFetchSuccessState({required this.list});
}

final class RandomFetchSuccesState extends MatchesFetchState {
  final RandomUsersModel list;

  RandomFetchSuccesState({required this.list});
}
