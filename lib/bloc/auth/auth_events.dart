import 'package:chat_app/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvents extends Equatable{}

class AutoLoginEvent extends AuthEvents{
  @override
  List<Object> get props => [];

}

class LoginEvent extends AuthEvents{
  final User user;
  LoginEvent({@required this.user});

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvents{
  final User user;
  SignUpEvent({@required this.user});

  @override
  List<Object> get props => [];
}

class LogOutEvent extends AuthEvents{
  @override
  // TODO: implement props
  List<Object> get props => [];

}