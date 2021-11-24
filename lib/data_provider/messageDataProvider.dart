import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:chat_app/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class MessageDataProvider{
  final http.Client httpClient;
  final  baseUrl = "http://192.168.56.1:8080";

  MessageDataProvider({@required this.httpClient})
      :assert(httpClient != null);

 Future<List<Message>> getMessages() async {

   List<Message>messages;
   final  url = "$baseUrl/v1/message";

   try {
     final response = await httpClient.get(Uri.parse(url));
     print(response.statusCode);
     if (response.statusCode == 200) {
       final extractedData = json.decode(response.body) as List<dynamic>;

       if (extractedData == null) {
         return null;
       }
       else {
         messages = extractedData.map<Message>((json) => Message.fromJson(json)).toList();

       }
     }
     else {
       throw HttpException("error occurred");

     }
   } catch (e) {
     throw e;
   }
   return messages;


 }

 Future<Message> getMessage(String id) async {
   Message message;
   final url = "$baseUrl/v1/message/$id";

   try{

     final response = await httpClient.get(Uri.parse(url));

     if(response.statusCode == 200){

       final extractedData = json.decode(response.body)as Map<String,dynamic>;

       if (extractedData == null){
         return null;
       }
        else{
            message = Message.fromJson(extractedData);
       }
     }

     else{
       throw HttpException("error has occurred!");
     }
   } catch(e){
              throw e;
   }
   return message;

 }

Future<Message> postMessage(Message message) async{
     Message message;
     final url = "$baseUrl/v1/message/${message.id}";

     try{
       final response = await httpClient.post(
         Uri.parse(url),
         body: json.encode({
             "msg":message.msg,
             "msgFrom":message.msgFrom
         }),
         headers: {
              HttpHeaders.contentTypeHeader:"application/json",
         },
       );

        if(response.statusCode == 201){
          final extractedData = json.decode(response.body) as Map<String,dynamic>;

          message = Message.fromJson(extractedData);
        }
        else{
          throw HttpException("error has occurred");
        }

     }catch(e){
       throw e;
     }
     return message;
}


  Future<Message> putMessage(Message message) async{
    Message message;
    final url = "$baseUrl/v1/message/${message.id  }";

    try{
      final response = await httpClient.put(
        Uri.parse(url),
        body: json.encode({
          "msg":message.msg,
          "msgFrom":message.msgFrom
        }),
        headers: {
          HttpHeaders.contentTypeHeader:"application/json",
        },
      );

      if(response.statusCode == 201){
        final extractedData = json.decode(response.body) as Map<String,dynamic>;

        message = Message.fromJson(extractedData);
      }
      else{
        throw HttpException("error has occurred");
      }

    }catch(e){
      throw e;
    }
    return message;
  }

  Future<void> deleteMessage(String id) async {
     final url = "$baseUrl/v1/message/$id";

     try{

       final response = await httpClient.delete(
         Uri.parse(url),

         headers: {
           HttpHeaders.contentTypeHeader:"application/json",
         },
       );

       if(response.statusCode != 200){
         throw HttpException("error has occurred!");
       }

     }catch(e){
       throw e;
     }
  }

}