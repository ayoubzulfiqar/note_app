import '../../../data/submission_status.dart';

class SignupState {
  final String email;
  bool get isVaildEmail => email.contains('@');
  final String password;
  bool get isVaildPassword => password.length > 6;
  final String confirmPassword;
  bool get isValidPassword => password == confirmPassword;
  final FormSubmissionStatus formStatus;

  SignupState(
      {this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.formStatus = const InitialFormStatus()});

  SignupState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        formStatus: formStatus ?? this.formStatus);
  }
}
