import 'package:flutter/material.dart';

final ThemeData defaultTheme =  ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  primarySwatch: Colors.green,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.green,
    // backgroundColor: Theme.of(context).primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold
    ),
    iconTheme: IconThemeData(color: Colors.white,),
  ),
  cardTheme: const CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.green,
        width: 2
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    )
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 24,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(Colors.green),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: Colors.green.shade900,
          width: 2,
        )
      )),
      textStyle: MaterialStateProperty.all(const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ))
    ),
  ),
);
