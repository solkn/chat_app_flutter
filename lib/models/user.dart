import 'package:flutter/cupertino.dart';

class User{
  String firstName;
  String lastName;
  String email;
  String password;

  User({@required this.email,@required this.password});
  User.fullInfo({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  List<Object>get props =>[firstName,lastName,email,password];

  factory User.fromJson(Map<String,dynamic>json){
    return User.fullInfo(
        firstName:json["first_name"],
        lastName:json["last_name"],
        email: json["email"],
        password: json["password"],

    );
  }

  String toString(){
    return 'User.fullInfo{firstName:$firstName,lastName:$lastName,email:$email'
        'password:$password}';
  }

}

