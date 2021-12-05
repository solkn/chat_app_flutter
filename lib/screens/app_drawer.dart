import 'package:chat_app/bloc/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Chat'),
              automaticallyImplyLeading: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child:Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/sol.jpg"),
                          fit: BoxFit.fill,
                      ),

                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("Solomon ",
                      style: TextStyle(
                        color: Colors.blueAccent,fontSize: 25,
                        fontStyle: FontStyle.italic),
                      ),
                      Text("+251943550992",
                        style: TextStyle(
                            color: Colors.blueAccent,fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.where_to_vote),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),

            Divider(),
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text("New Group"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text("New Channel"),
              onTap: () {},
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text("contacts"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_phone_rounded),
              title: Text("online contacts"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("call"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
              onTap: () {},
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}