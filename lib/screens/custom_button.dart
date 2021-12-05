
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String title;
  final Color color;
  final Function onPressed;

  CustomButton({@required this.title,@required this.color,@required this.onPressed});


      Widget build(BuildContext context) {

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            elevation: 5.0,
            color: color,
            borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
            child: MaterialButton(
              onPressed: onPressed,
              minWidth: 200.0,
              height: 50.0,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );

  }
}