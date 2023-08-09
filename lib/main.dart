import "package:flutter/material.dart";
import 'package:expensetrack/widgets/expense.dart';
var scf = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 14, 94));
  var avv = ColorScheme.fromSeed(seedColor: Colors.black);
  void main(){

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(
        useMaterial3: true , 
      
      ).copyWith(
        colorScheme: avv,
        scaffoldBackgroundColor:const Color.fromARGB(255, 0, 0, 0),
      
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(120, 255, 14, 94),
        foregroundColor: Colors.white,
        )
      ),
      theme: ThemeData(useMaterial3: true, colorScheme: scf).copyWith(
        scaffoldBackgroundColor:Color.fromARGB(255, 255, 248, 250),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(120, 255, 14, 94),
        foregroundColor: Colors.black,
        )
      ),
      themeMode: ThemeMode.system,
      home : expenses()
    ),
  );
}