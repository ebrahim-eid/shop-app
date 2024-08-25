abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangeIconVisibilityState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String message;

  LoginSuccessState(this.message);
}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final String message;

  RegisterSuccessState(this.message);
}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}

class UserDataLoadingState extends AuthStates {}

class UserDataSuccessState extends AuthStates {}

class UserDataErrorState extends AuthStates {
  final String error;

  UserDataErrorState(this.error);
}

class UpdateUserDataLoadingState extends AuthStates {}

class UpdateUserDataSuccessState extends AuthStates {
  final String message;

  UpdateUserDataSuccessState(this.message);
}

class UpdateUserDataErrorState extends AuthStates {
  final String error;

  UpdateUserDataErrorState(this.error);
}