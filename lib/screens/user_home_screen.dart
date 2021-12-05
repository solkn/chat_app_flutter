import 'package:chat_app/screens/app_drawer.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget{
   
   static const routeName = "user_home_screen";

   _UserHomeScreenState createState()=> _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> with SingleTickerProviderStateMixin{

  final scaffoldKey = GlobalKey<ScaffoldState>();

   TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4,vsync: this);
  }

  @override
  void dispose() {
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
              text: "Contacts",
            ),

            Tab(
              text: "Groups",
            ),

            Tab(
              text: "Messages",
            ),

            Tab(
              text: "Channels",
            ),

          ],
        ),

      ),
      drawer: AppDrawer(),

      body: TabBarView(controller: controller,children:<Widget> [

        LoginScreen(),
        LoginScreen(),
        LoginScreen(),
        LoginScreen(),

      ]),




    );
  }

}