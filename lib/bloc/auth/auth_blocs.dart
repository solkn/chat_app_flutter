import 'package:bloc/bloc.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates>{

  final UserRepository userRepository;

  AuthBloc({@required this.userRepository})
  :assert(userRepository != null),super(AuthUninitializedState());
  @override
  Stream<AuthStates> mapEventToState(AuthEvents event) async* {
    if(event is LoginEvent){
      yield* _mapLoginEventToState(event.user);
    }
    if(event is SignUpEvent){
      yield* _mapSignUpEventToState(event.user);
    }

  }

  Stream<AuthStates> _mapLoginEventToState(User user) async*{
    yield LoggingState();

    User usr;

    try{
         usr = await userRepository.login(user);

         yield LoginSuccessState(user: usr);

    }catch(e){
       yield LoginFailedState();
    }

  }

  Stream<AuthStates> _mapSignUpEventToState(User user)async*{
    yield SigningUpState();
    User usr;
    try{
      usr = await userRepository.signUp(user);
      yield SignUpSuccessState(user: user);

    }catch(e){
      yield SignUpFailedState();
    }
  }
}