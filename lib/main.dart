import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import './pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  return runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VilleTrixx",
      theme: ThemeData(
        // Define the default brightness and colors.
        //brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
        primaryColorDark: Colors.blueGrey[800],
        primaryColorLight: Colors.blueGrey[300],
        backgroundColor: Colors.white,

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72, fontFamily: 'Robo'),
          headline6: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      home: HomePage()));
}
