import 'package:chat_app/bloc/auth/auth.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/screens/custom_button.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:chat_app/screens/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget{
  static const String routName ="login_screen";

  @override
  LoginScreenState createState() {

    return LoginScreenState();
  }

}
class LoginScreenState extends State<LoginScreen>{
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 0.0),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc,AuthStates>(
            listener: (context,state){

              if(state is LoginSuccessState){
                  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                }
            },
            builder:(context,state){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: (state is LoggingState)
                        ? SizedBox(

                      child: CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation<Color>(Colors.redAccent),
                        strokeWidth: 8,
                      ),
                      height:40.0,
                      width: 70.0,

                    )

                        : Container(
                        height: 100.0,
                        child: Image.asset('images/logo.png')),

                  ),
                  (state is LoginFailedState)
                      ?Container(
                      child:Center(
                        child: Text("Authentication Failed",style: TextStyle(color: Colors.red,fontWeight:
                        FontWeight.bold,fontStyle: FontStyle.italic),),
                      )
                  )
                      :SizedBox(
                    height: 1,
                  ),

                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value){
                      email = value;

                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(50,50)),
                      ),
                      hintText: "email",
                    ),



                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value){
                      password = value;

                    },
                   decoration: const InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.elliptical(50,50)),
                     ),
                     hintText: "password",
                   ),

                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  CustomButton(
                     title: "Login",
                     color: Colors.blueAccent,
                     onPressed: () {
                       final form = _formKey.currentState;
                       if(!form.validate()) {
                         return;
              }

                       User user = new User(email: email,password: password);
                       LoginEvent loginEvent = new LoginEvent(user: user);
                       BlocProvider.of<AuthBloc>(context).add(loginEvent);

                       Navigator.of(context).pushReplacementNamed(UserHomeScreen.routeName);
              }
              ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }

}