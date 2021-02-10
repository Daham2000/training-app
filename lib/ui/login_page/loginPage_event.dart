abstract class LoginEvent {}

class SaveUserName extends LoginEvent{
  final String name;

  SaveUserName(this.name);
}