import 'package:bloc/bloc.dart';
import 'package:mere_maahi_dummy/Firebase/userfech_model.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/user/repo.dart';
import 'package:mere_maahi_dummy/model/userfetch.dart';
import 'package:meta/meta.dart';

part 'userdetails_event.dart';
part 'userdetails_state.dart';

class UserdetailsBloc extends Bloc<UserdetailsEvent, UserdetailsState> {
  UserdetailsBloc() : super(UserdetailsInitial()) {
    on<UserdetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchUserDetails>((event, emit) async {
      final response = await UserFetchRepo.userfetchReq();
      emit(UserFetched(model: response!));
    });
  }
}
