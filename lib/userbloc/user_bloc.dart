import 'package:bloc/bloc.dart';
import 'package:webapp/repo/repositories.dart';
import 'package:webapp/userbloc/user_event.dart';
import 'package:webapp/userbloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users!));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
