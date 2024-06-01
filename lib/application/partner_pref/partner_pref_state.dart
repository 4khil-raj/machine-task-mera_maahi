part of 'partner_pref_bloc.dart';

@immutable
sealed class PartnerPrefState {}

final class PartnerPrefInitial extends PartnerPrefState {}

class PartnerPrefMoreButtonState extends PartnerPrefState {
  final bool more;

  PartnerPrefMoreButtonState({required this.more});
}
