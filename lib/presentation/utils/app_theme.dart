import 'package:flutter/material.dart';

mixin AppTheme {
  static get myTheme => ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: const Color.fromRGBO(0, 17, 26, 1),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          bodyText2: TextStyle(
            fontFamily: "Arial",

            //filter names
            fontSize: 14,
            color: Color.fromRGBO(102, 153, 153, 1),
          ),
          caption: TextStyle(
            fontFamily: "Arial",
            //price tag in discover page
            fontSize: 12,
            color: Color.fromRGBO(235, 235, 245, 0.6),
          ),
          subtitle1: TextStyle(
            fontFamily: "Arial",

            //price tag in filter details
            fontSize: 14,
            color: Color.fromRGBO(150, 150, 150, 1),
          ),
          subtitle2: TextStyle(
            fontFamily: "Arial",

            //search text
            fontSize: 17,

            color: Color.fromRGBO(235, 235, 245, 0.6),
          ),
          button: TextStyle(
            fontFamily: "Arial",
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      );
}
