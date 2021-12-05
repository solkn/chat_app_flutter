import 'package:chat_app/bloc/auth/auth.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/screens/custom_button.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget{
  static const String routName = "signUp_screen";

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }

}
class SignUpScreenState extends State<SignUpScreen>{
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: BlocConsumer<AuthBloc,AuthStates>(
              listener: (context,state){
                if(state is SignUpSuccessState){
                  Navigator.pushReplacementNamed(context,HomeScreen.routeName);
                }

              },
              builder: (context,state){
                return Column(
                  children: <Widget>[
                    (state is SignUpFailedState)
                        ?Container(
                        child: Center(
                            child: Text(
                              "SignUp Failed",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            )))
                        :SizedBox(
                      height: 1,
                    ),


                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(50, 50))),
                        hintText: " first name",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),


                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        lastName = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(50,50)),
                        ),
                        hintText: "last name"
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        email = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        ),
                        hintText: " email",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value){
                        password = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(50,50)),
                        ),
                        hintText: "password",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    CustomButton(
                      title: "Register",
                      color: Colors.blueAccent,
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (!form.validate()) {
                          return;
                        }
                        User user = new User.fullInfo(
                         firstName: firstName,
                          lastName: lastName,
                          email: email,
                          password: password,
                        );
                        SignUpEvent signUpEvent = new SignUpEvent(user: user);
                        BlocProvider.of<AuthBloc>(context)..add(signUpEvent);
                      },
                    ),

                  ],
                );
              },
            ),

          ),
        ),
      ),
    );
  }

}