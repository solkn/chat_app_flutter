import 'package:chat_app/bloc/user/user.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvents,UserStates>{
  final UserRepository userRepository;

  UserBloc({@required this.userRepository}):super(UserUnInitializedState());
  @override
  Stream<UserStates> mapEventToState(UserEvents event) async* {
    if(event is GetUserEvent){
      yield* _mapGetUserEventToState  ();
    }
    else if(event is UpdateUserEVent){
      yield* _mapUserUpdateEventToState(event.user);
    }

  }

  Stream<UserStates> _mapGetUserEventToState() async*{
    yield UserFetchingState();

    try {
      List<User>users;
      users = await userRepository.getUsers();

      yield UserFetchedState(users: users);
    }on HttpException catch(e){
      yield UserFetchingErrorState(message: e.message);
    }catch(e){
      yield UserFetchingErrorState();
    }
  }

  Stream<UserStates> _mapUserUpdateEventToState(User user)async*{
    yield UserUpdatingState();

    try{
       User usr;
      usr = await userRepository.updateUser(user);
       yield UserUpdatedState();
    }on HttpException catch(e){
      yield UserPostingErrorState(message: e.message);
    }catch(e){
      yield UserPostingErrorState();
    }
  }
}