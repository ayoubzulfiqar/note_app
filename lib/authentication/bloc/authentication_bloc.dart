// import 'dart:async';

// import 'package:equatable/equatable.dart';

// import 'package:bloc/bloc.dart';

// import 'authentication_event.dart';
// import 'package:topnote/data/user_repository.dart';
// part 'authentication_state.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final UserRepository userRepository;

//   AuthenticationBloc({required this.userRepository})
//       : super(AuthenticationInitial());

//   AuthenticationState get initialState => AuthenticationUninitialized();

//   Stream<AuthenticationState> mapEventToState(
//     AuthenticationState currentState,
//     AuthenticationEvent event,
//   ) async* {
//     if (event is AppStarted) {
//       final bool hasToken = await userRepository.hasToken();

//       if (hasToken) {
//         yield AuthenticationAuthenticated();
//       } else {
//         yield AuntheticationUnauthenticated();
//       }
//     }

//     if (event is LoggedIn) {
//       yield AuthenticationLoading();
//       await userRepository.persistToken(event.token);
//       yield AuthenticationAuthenticated();
//     }

//     if (event is LoggedOut) {
//       yield AuthenticationLoading();
//       await userRepository.deleteToken();
//       yield AuntheticationUnauthenticated();
//     }
//   }
// }
