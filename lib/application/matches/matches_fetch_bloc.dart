import 'package:bloc/bloc.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/maches/repo.dart';
import 'package:mere_maahi_dummy/model/matchesmodel.dart';
import 'package:mere_maahi_dummy/model/randomusers.dart';
import 'package:meta/meta.dart';

part 'matches_fetch_event.dart';
part 'matches_fetch_state.dart';

class MatchesFetchBloc extends Bloc<MatchesFetchEvent, MatchesFetchState> {
  MatchesFetchBloc() : super(MatchesFetchInitial()) {
    on<MatchesFetchEvent>((event, emit) {
      emit(MatchesFetchInitial());
    });

    on<RequestEvent>((event, emit) async {
      try {
        final response = await MatchesRepoScreen.matchesFetch();
        print(response[0].firstName);
        emit(MatchesFetchSuccessState(list: response));
      } catch (e) {
        print(e);
      }
    });

    on<RandomUserEvent>((event, emit) async {
      try {
        final response = await RandomUserFechRepo.randomUser();
        print(response.users![1].firstName);
        emit(RandomFetchSuccesState(list: response));
      } catch (e) {
        print(e);
      }
    });
  }
}
