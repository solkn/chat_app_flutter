import 'package:chat_app/bloc/message/message_events.dart';
import 'package:chat_app/bloc/message/message_states.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<MessageEvents,MessageStates> {

  final MessageRepository messageRepository;

  MessageBloc({@required this.messageRepository}) : super(MessageUnInitializedState());


  @override
  Stream<MessageStates> mapEventToState(MessageEvents event)async* {
    if(event is GetMessageEvent){
      yield* _mapGetMessageEventToState();
    }
    else if(event is PostMessageEvent){
      yield* _mapPostMessageEventToState(event.message);
    }
    else if(event is UpdateMessageEvent){
      yield* _mapUpdateMessageEventToState(event.message);
    }
    else if(event is DeleteMessageEvent){
      yield* _mapDeleteMessageEventToState(event.id);
    }
  }


  Stream<MessageStates> _mapGetMessageEventToState() async* {
    yield MessageFetchingState();

    try{

      List<Message>messages;
      messages = await messageRepository.getMessages();

      yield MessageFetchedState(message: messages);

    }catch(e){
      yield MessageFetchingErrorState();
    }
  }

 Stream<MessageStates>_mapPostMessageEventToState(Message message)async*{
    yield MessagePostingState();

    try{
       await messageRepository.postMessage(message);

       yield MessagePostedState();
    }catch(e){
      yield MessagePostingErrorState();
    }
 }

 Stream<MessageStates>_mapUpdateMessageEventToState(Message message)async*{
    yield MessageUpdatingState();

    try{

      await messageRepository.updateMessage(message);

      yield MessageUpdatedState();

    }catch(e){
      yield MessageUpdatingErrorState();
    }
 }

 Stream<MessageStates>_mapDeleteMessageEventToState(String id)async*{
    yield MessageDeletingState();

    try{
        await messageRepository.deleteMessage(id);

    }catch(e){
      yield MessageUpdatingErrorState();
    }
 }


}