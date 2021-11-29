import 'package:chat_app/bloc/auth/auth.dart';
import 'package:chat_app/bloc/message/message.dart';
import 'package:chat_app/bloc/message/message_events.dart';
import 'package:chat_app/bloc/user/user.dart';
import 'package:chat_app/data_provider/data.dart';
import 'package:chat_app/repository/repository.dart';
import 'package:chat_app/screens/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main(){

  UserRepository userRepository = UserRepository(
      userDataProvider: UserDataProvider(httpClient: http.Client()));
  MessageRepository messageRepository = MessageRepository(
      messageDataProvider: MessageDataProvider(httpClient: http.Client()));

  runApp(ChatApp(
      userRepository: userRepository,
      messageRepository: messageRepository,
  ));

}

class ChatApp extends StatelessWidget{
  final UserRepository userRepository;
  final MessageRepository messageRepository;

  ChatApp({
    @required this.userRepository,
    @required this.messageRepository,
  }):assert(
  userRepository != null &&
  messageRepository != null,
  );

  @override
  Widget build(BuildContext context) {

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) =>userRepository,
        ),
        RepositoryProvider<MessageRepository>(
          create:(context)=>messageRepository
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context)=>AuthBloc(userRepository: this.userRepository),
          ),
          BlocProvider<UserBloc>(
            create: (context)=>UserBloc(userRepository: this.userRepository)..add(GetUserEvent()),
          ),
          BlocProvider<MessageBloc>(
            create: (context)=>MessageBloc(messageRepository: this.messageRepository)..add(GetMessageEvent()),
          ),
        ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "chatApp",
          initialRoute: "/",
          onGenerateRoute: ChatAppRoute.generateRoute,
        ),
      ),
    );
  }



}