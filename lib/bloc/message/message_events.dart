import 'package:chat_app/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MessageEvents extends Equatable{}

class GetMessageEvent extends MessageEvents{

  GetMessageEvent();
  @override
  List<Object> get props => [];

}

class PostMessageEvent extends MessageEvents{

  final Message message;

  PostMessageEvent({@required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateMessageEvent extends MessageEvents{
  final Message message;
  UpdateMessageEvent({@required this.message});

  @override
  List<Object> get props => [];
}

class DeleteMessageEvent extends MessageEvents{
  final String id;
  DeleteMessageEvent({@required this.id});

  @override
  List<Object> get props => [];
}