part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

final class BottomnavcallEvent extends BottomNavEvent {
  final int currentIndex;
  BottomnavcallEvent({required this.currentIndex});
}
