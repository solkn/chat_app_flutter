import 'package:chat_app/bloc/user/user.dart';
import 'package:chat_app/models/model.dart';
import 'package:flutter/cupertino.dart';

abstract class UserStates{}

class UserUnInitializedState extends UserStates{}

class UserFetchingState extends UserStates{}

class UserFetchedState extends UserStates{
    final List<User>users;
    UserFetchedState({@required this.users});
}
class UserFetchingErrorState extends UserStates{
  final String message;
  UserFetchingErrorState({@required this.message});
}

class UserPostingState extends UserStates{}

class UserPostedState extends UserStates{}

class UserPostingErrorState extends UserStates{
  final String message;
   UserPostingErrorState({@required this.message});
}

class UserUpdatingState extends UserStates{}

class UserUpdatedState extends UserStates{}

class UserUpdateErrorState extends UserStates{
  final String message;
  UserUpdateErrorState({@required this.message});
}

class UserDeletingState extends UserStates{}

class UserDeletedState extends UserStates{}

class UserDeleteErrorState extends UserStates{
  final String message;
  UserDeleteErrorState({@required this.message});
}