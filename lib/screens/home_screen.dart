import 'package:chat_app/screens/app_drawer.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  static const routeName = "home_screen";

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  TabController controller;
  @override
  void initState() {
  super.initState();
  controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
  controller.dispose();
  super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("chat"),
        backgroundColor: Colors.pink,

        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){

              },
          ),

        ],

        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "Login",
            ),

            Tab(
              text: "Register",
            ),

          ],
        ),

      ),
      drawer: AppDrawer(),

      body: TabBarView(controller: controller,children:<Widget> [

          LoginScreen(),
          SignUpScreen(),
      ]),


    );

  }




}