part of 'signup_bloc.dart';

abstract class SignupEvent {}

class SignupEmailChanged extends SignupEvent {
  final String email;
  SignupEmailChanged({required this.email});
}

class SignupPasswordChanged extends SignupEvent {
  final String password;
  SignupPasswordChanged({
    required this.password,
  });
}

class SignupNewpasswordChanged extends SignupEvent {
  final String newPassword;
  SignupNewpasswordChanged({
    required this.newPassword,
  });
}

class SignupSubmitted extends SignupEvent {}
