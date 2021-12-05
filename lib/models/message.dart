import 'package:flutter/cupertino.dart';

import 'model.dart';
import 'dart:convert';
class Message{
  int id;
  String msg;
  User msgFrom;

  Message({@required this.id,@required this.msg,@required this.msgFrom});

  factory Message.fromJson(Map<String,dynamic>json){
     return Message(
         id:json["id"],
         msg:json["msg"],
         msgFrom:User.fromJson(json["user_id"]),
     );
  }
}