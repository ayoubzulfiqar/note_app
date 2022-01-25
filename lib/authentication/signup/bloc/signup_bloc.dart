import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/auth_repository.dart';
import '../../../data/submission_status.dart';

import 'signup_state.dart';

part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepo;
  // final AuthCubit authCubit;
  SignupBloc(
    this.authRepo,
  ) : super(SignupState());
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is SignupPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignupNewpasswordChanged) {
      yield state.copyWith(confirmPassword: event.newPassword);
    } else if (event is SignupSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.signUp(
            email: state.email,
            password: state.password,
            newPassword: state.confirmPassword);
        yield state.copyWith(formStatus: SubmissionSuccessful());
      } catch (error) {
        yield state.copyWith(
          formStatus: SubmissionFailed(
            Exception(error),
          ),
        );
      }
    }
  }
}
