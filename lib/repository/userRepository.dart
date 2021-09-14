import 'package:chat_app/data_provider/data.dart';
import 'package:chat_app/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:async/async.dart';
class UserRepository{
  final UserDataProvider userDataProvider;

  UserRepository({@required this.userDataProvider});


  Future<User>login(User user)async{
    return await userDataProvider.login(user);


  }

  Future<User>signUp(User user)async{
    return await userDataProvider.signUp(user);
  }

  Future<List<User>>getUsers()async{
    return await userDataProvider.getUsers();
  }

  Future<User>updateUser(User user)async{
    return await userDataProvider.updateUser(user);
  }
}