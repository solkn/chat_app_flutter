import 'package:chat_app/models/model.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthStates{}

class AuthUninitializedState extends AuthStates{}

class AutoLoggingState extends AuthStates{}

class AutoLoginSuccess extends AuthStates{
   final User user;

   AutoLoginSuccess({@required this.user});
}

class AutoLoginFailedState extends AuthStates{
  final String message;
  AutoLoginFailedState({@required this.message});
}

class LoggingState extends AuthStates{}
class LoginSuccessState extends AuthStates{
  final User user;
  LoginSuccessState({@required this.user});
}
class LoginFailedState extends AuthStates{
  final String message;
  LoginFailedState({@required this.message});
}

class SigningUpState extends AuthStates{}

class SignUpSuccessState extends AuthStates{
  final User user;
  SignUpSuccessState({@required this.user});
}
class SignUpFailedState extends AuthStates{
  final String message;
  SignUpFailedState({@required this.message});
}

class LoggingOutState extends AuthStates{}
class LogOutSuccessState extends AuthStates{
  final User user;
  LogOutSuccessState({@required this.user});
}
class LogOutFailedState extends AuthStates{
  final String message;
  LogOutFailedState({@required this.message});
}