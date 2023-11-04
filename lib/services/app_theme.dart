import 'package:flutter/material.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.white),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white))),
        textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey, unselectedItemColor: Colors.white)),
    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
      brightness: Brightness.light,
      primaryColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black))),
      textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black),
    )
  };
}