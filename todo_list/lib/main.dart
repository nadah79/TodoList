// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:todo_list/add_list.dart';
import 'package:todo_list/edit_list.dart';
import 'package:todo_list/home_screen.dart';
import 'package:todo_list/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScrren(),
        "/list": (context) => ListScreen(),
        "/add": (context) => AddList(),
        "/edit": (context) => EditList(),
      },
    );
  }
}
