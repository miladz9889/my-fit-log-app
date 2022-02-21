part of 'signup_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpButtonEnableChangedState extends SignUpState {
  final bool isEnabled;

  SignUpButtonEnableChangedState({
    required this.isEnabled,
  });  
}

class ShowErrorState extends SignUpState {}

class ErrorState {
  final String message;

  ErrorState({ required this.message,});
}

class NextTabBarPageState extends SignUpState {
  
}

class NextSignInPageState extends SignUpState {
  
}

class LoadingState extends SignUpState {
  
}
