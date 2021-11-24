import 'package:chat_app/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UserEvents extends Equatable{}

class GetUserEvent extends UserEvents{
  GetUserEvent();

  @override
  List<Object> get props => [];
}

class PostUserEvent extends UserEvents{
  final User user;
  PostUserEvent({@required this.user});
  @override
  List<Object> get props => [];
}

class UpdateUserEVent extends UserEvents{
  final User user;
  UpdateUserEVent({@required this.user});

  @override
  List<Object> get props => [];
}
class DeleteUserEvent extends UserEvents {
  final String id;
  DeleteUserEvent({@required this.id});

  @override
  List<Object> get props => [];
}