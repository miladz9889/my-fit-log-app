import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/validation_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();  
  final confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;


  @override
  Stream<SignUpState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is OnTextChangedEvent) {
      if (isButtonEnabled != checkIfSignUpButtonEnabled()) {
        isButtonEnabled = checkIfSignUpButtonEnabled();
        yield SignUpButtonEnableChangedState(isEnabled: isButtonEnabled);
      }
    } else if (event is SignUpTappedEvent) {
      if (checkValidatorsOfTextField()) {
        // try {
        //   yield LoadingState();
        //   await AuthService.signUp(emailController.text, passwordController.text, userNameController.text);
        //   yield NextTabBarPageState();
        //   print("Go to the next page");
        // } 
        // // catch (e) {
        // //   yield ErrorState(message: e.toString());
        // // }
      } else {
        yield ShowErrorState();
      }
    } else if (event is SignInTappedEvent) {
      yield NextSignInPageState();
    }
  }

 bool checkIfSignUpButtonEnabled() {
    return userNameController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  bool checkValidatorsOfTextField() {
    return ValidationService.username(userNameController.text) &&
        ValidationService.email(emailController.text) &&
        ValidationService.password(passwordController.text) &&
        ValidationService.confirmPassword(passwordController.text, confirmPasswordController.text);
  }
}