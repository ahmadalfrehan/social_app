abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  //final LoginModel loginModel;

  //LoginSuccessState(this.loginModel);
}

class LoginSuccessStateT extends LoginStates {
  //final TempModel tempModel;

  // LoginSuccessStateT(this.tempModel);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginStates {}
