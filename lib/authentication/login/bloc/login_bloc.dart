import 'package:bloc/bloc.dart';
import '../../../data/auth_repository.dart';
import '../../../data/submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState());
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username, password: '');
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password, username: '');
    } else if (event is LoginSubmitted) {
      yield state.copyWith(
          formStatus: FormSubmitting(), password: '', username: '');

      try {
        await authRepo.login();
        yield state.copyWith(
            formStatus: SubmissionSuccessful(), password: '', username: '');
      } catch (error) {
        yield state.copyWith(
          formStatus: SubmissionFailed(
            Exception(error),
          ),
          password: '',
          username: '',
        );
      }
    }
  }
}
