abstract class LoginEvent {}

class UserLoggedEvent extends LoginEvent {
  final String email;
  final String uid;

  UserLoggedEvent(this.email, this.uid);
}

class ErrorEvent extends LoginEvent {
  final String error;

  ErrorEvent(this.error);
}

class SigninEvent extends LoginEvent {
  final String email;
  final String password;

  SigninEvent(this.email, this.password);
}

class SignUpEvent extends LoginEvent {
  final String email;
  final String password;

  SignUpEvent(this.email, this.password);
}
