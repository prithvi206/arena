import 'package:arena/screens/quiz/quiz_screen.dart';
import 'package:arena/screens/score/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: QuizScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => QuizScreen(),
        '/score': (context) => ScoreScreen(),
      },
    );
  }
}
