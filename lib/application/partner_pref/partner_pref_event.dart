part of 'partner_pref_bloc.dart';

@immutable
sealed class PartnerPrefEvent {}

class PartnerMoreButtonEvent extends PartnerPrefEvent {
  final bool more;

  PartnerMoreButtonEvent({required this.more});
}
