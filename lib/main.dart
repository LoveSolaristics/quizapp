import 'package:flutter/material.dart';
import 'package:quizapp/pages/home.dart';
import 'package:quizapp/pages/author.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor:  Colors.deepOrangeAccent,
  ),
  initialRoute: '/',
  routes: {
    '/': (context)=> Home(),
    '/author': (context)=> Author(),
  },

));