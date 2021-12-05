


import 'package:chat_app/models/model.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/message_screen.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:chat_app/screens/user_home_screen.dart';
import 'package:flutter/material.dart';

bool isAuthenticated = false;

class ChatAppRoute{

  static Route generateRoute(RouteSettings settings){

    final routes = settings.name;

    switch(routes){
      case "/":
        return MaterialPageRoute(
            builder: (context)=>HomeScreen());
        break;
      case LoginScreen.routName:
        return MaterialPageRoute(
            builder: (context)=>LoginScreen());
      break;
      case SignUpScreen.routName:
        return MaterialPageRoute(
            builder: (context)=>SignUpScreen());
      break;
      case MessageScreen.routeName:
        return MaterialPageRoute(
            builder: (context)=>MessageScreen());
       break;
      case UserHomeScreen.routeName:
         return MaterialPageRoute(
           builder: (context)=>UserHomeScreen());
      break;
      default:
        return null;
    }

  }
}

class MessageRouteArguments{
  final Message message;
  final bool edit;

  MessageRouteArguments({@required this.message,@required this.edit});
}