import 'model.dart';
import 'dart:convert';
class Message{
  String msg;
  User user;

  Message({this.msg,this.user});

  factory Message.fromJson(Map<String,dynamic>json){
     return Message(
         msg:json["msg"],
         user:User.fromJson(json["user_id"]),
     );
  }
}