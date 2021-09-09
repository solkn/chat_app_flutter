import 'model.dart';
import 'dart:convert';
class Message{
  int id;
  String msg;
  User msgFrom;

  Message({this.msg,this.msgFrom});

  factory Message.fromJson(Map<String,dynamic>json){
     return Message(
         msg:json["msg"],
         msgFrom:User.fromJson(json["user_id"]),
     );
  }
}