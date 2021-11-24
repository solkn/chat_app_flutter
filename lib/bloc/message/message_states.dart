import 'package:chat_app/models/model.dart';
import 'package:flutter/cupertino.dart';

abstract class MessageStates{}

class MessageUnInitializedState extends MessageStates{}

class MessageFetchingState extends MessageStates{}

class MessageFetchedState extends MessageStates{
  final List<Message>message;

  MessageFetchedState({@required this.message});
}
class MessageFetchingErrorState extends MessageStates{
  final String message;
  MessageFetchingErrorState({@required this.message});
}


class MessagePostingState extends MessageStates{}

class MessagePostedState extends MessageStates{}

class MessagePostingErrorState extends MessageStates{
  final String message;
  MessagePostingErrorState({@required this.message});
}

class MessageUpdatingState extends MessageStates{}

class MessageUpdatedState extends MessageStates{}

class MessageUpdatingErrorState extends MessageStates{
  final String message;
  MessageUpdatingErrorState({@required this.message});
}

class MessageDeletingState extends MessageStates{}

class MessageDeletedState extends MessageStates{}

class MessageDeletedErrorState extends MessageStates{
  final String message;
  MessageDeletedErrorState({@required this.message});
}