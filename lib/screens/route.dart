


import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
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
      default:
        return null;
    }

  }
}