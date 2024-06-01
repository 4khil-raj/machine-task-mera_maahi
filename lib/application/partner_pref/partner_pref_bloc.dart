import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'partner_pref_event.dart';
part 'partner_pref_state.dart';

class PartnerPrefBloc extends Bloc<PartnerPrefEvent, PartnerPrefState> {
  PartnerPrefBloc() : super(PartnerPrefInitial()) {
    on<PartnerPrefEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PartnerMoreButtonEvent>((event, emit) {
      if (event.more) {
        emit(PartnerPrefMoreButtonState(more: false));
      } else {
        emit(PartnerPrefMoreButtonState(more: true));
      }
    });
  }
}
