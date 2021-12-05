
import 'package:chat_app/bloc/message/message.dart';
import 'package:chat_app/bloc/message/message_events.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/screens/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageAddUpdateScreen extends StatefulWidget{
  static const routeName = "message_add_screen";

  final MessageRouteArguments messageRouteArguments;

  MessageAddUpdateScreen({@required this.messageRouteArguments});

  _MessageAddUpdateScreenState createState() {
    return _MessageAddUpdateScreenState();
  }

}

class _MessageAddUpdateScreenState extends State<MessageAddUpdateScreen>{

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  final _messageFocusNode = FocusNode();

  String msg = "";
  Message message =  Message();
  bool isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInit && widget.messageRouteArguments.edit) {
      msg = widget.messageRouteArguments.message.msg;
      isInit = true;
    }
  }

  @override
  void dispose() {

    _messageFocusNode.dispose();

    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState.save();

    if (widget.messageRouteArguments.edit) {
      message = Message(
        id: widget.messageRouteArguments.message.id,
        msg: widget.messageRouteArguments.message.msg,
        msgFrom: widget.messageRouteArguments.message.msgFrom,
      );

      BlocProvider.of<MessageBloc>(context, listen: false)
        ..add(UpdateMessageEvent(message: message));
    } else {

      message = Message(
        msg: msg,
        msgFrom: widget.messageRouteArguments.message.msgFrom,
      );

      BlocProvider.of<MessageBloc>(context,listen: false)
        ..add(PostMessageEvent(message: message));


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldMessengerKey,
      appBar: AppBar(
        title:
        widget.messageRouteArguments.edit ? Text("Update Message") : Text("Add Message"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: _saveForm)
        ],
      ),

      body: BlocConsumer<MessageBloc, MessageStates>(
        listener: (_, state) {
          if ((state is MessagePostingState) || (state is MessageUpdatingState)) {
            return Center(child: CircularProgressIndicator());
          }
          if(state is MessagePostingErrorState){

            _scaffoldMessengerKey.currentState.showSnackBar(
              SnackBar(content: Text("error has occurred during adding message"))
            );

            if(state is MessageUpdatingErrorState){
              _scaffoldMessengerKey.currentState.showSnackBar(
                SnackBar(content: Text("error has occurred during message updating"))
              );

            }

          }
          if((state is MessagePostedState) || (state is MessageUpdatedState)){

            BlocProvider.of<MessageBloc>(context).add(GetMessageEvent());
          }

        },
        builder: (_, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    child: TextFormField(
                      initialValue: widget.messageRouteArguments.edit
                          ? widget.messageRouteArguments.message.msg
                          : msg,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_messageFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'invalid input';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        msg = value;
                      },
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: widget.messageRouteArguments.edit
                              ? widget.messageRouteArguments.message.msg
                              : msg,
                          hintText: 'Enter Message'),
                    ),
                  ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }

}