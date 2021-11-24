import 'package:chat_app/data_provider/data.dart';
import 'package:chat_app/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class MessageRepository{
  final MessageDataProvider messageDataProvider;

  MessageRepository({@required this.messageDataProvider});


  Future<List<Message>> getMessages() async{

    return await messageDataProvider.getMessages();

  }
  Future<Message> getMessage(String id) async{
    return await messageDataProvider.getMessage(id);
  }

  Future<Message> postMessage(Message message) async{
     return await messageDataProvider.postMessage(message);
  }

  Future<Message> updateMessage(Message message) async{
    return await messageDataProvider.putMessage(message);
  }

  Future<void> deleteMessage(String id) async{
    return await messageDataProvider.deleteMessage(id);
  }

}