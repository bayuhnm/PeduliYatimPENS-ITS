import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peduli_yatim_pens_mobile/models/user_model.dart';

import 'package:peduli_yatim_pens_mobile/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetById) {
        try {
          emit(UserLoading());

          final res = await UserService().getUsersById(event.id);

          emit(UserSuccess(res));
        } catch (e) {
          print(e);

          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(UserLoading());

          final res = await UserService().getRecentUsers();

          emit(UserSuccess(res));
        } catch (e) {
          print(e);
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}