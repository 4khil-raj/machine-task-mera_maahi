part of 'matches_fetch_bloc.dart';

@immutable
sealed class MatchesFetchEvent {}

final class RequestEvent extends MatchesFetchEvent {}

final class RandomUserEvent extends MatchesFetchEvent {}
