abstract class LoginEvent {}

class SaveUserNameEvent extends LoginEvent{
  final String name;

  SaveUserNameEvent(this.name);
}