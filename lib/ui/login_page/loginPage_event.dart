abstract class LoginEvent {}

class SaveUserNameEvent extends LoginEvent {
  final String name;

  SaveUserNameEvent(this.name);
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
