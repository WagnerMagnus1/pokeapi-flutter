import 'dart:ui';

import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = Color.fromRGBO(46, 46, 46, 1);
const secondaryColor = Colors.yellow;

ThemeData lightTheme() {
  return ThemeData(
    // brightness: brightness,
    //   tabBarTheme: TabBarTheme(labelColor: Colors.blue),
    appBarTheme: AppBarTheme(elevation: 0),
    // backgroundColor: Colors.blue,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    // textTheme: new TextTheme(
    //   body1: new TextStyle(color: Colors.red),
    //   display4: new TextStyle(fontSize: 78),
    //   button: new TextStyle(color: Colors.green),
    // ),
    // accentIconTheme:
    // accentTextTheme:
    // bottomAppBarTheme:
    // buttonTheme: new ButtonThemeData(
    //   buttonColor: Colors.orange,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    // iconTheme:
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: primaryColor,
    accentColor: Colors.yellow,
    // fontFamily: 'Montserrat',
    // buttonColor: Color(0xFF00C569),
    // // scaffoldBackgroundColor: backgroundColor,
    // cardColor: Colors.white,
  );
}
