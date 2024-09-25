import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/first_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> answers = [];
  @override
  void initState() {
    activeScreen = FirstScreen(switchScreen);
    super.initState();
  }

  void answerQuestion(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          choosenAnswers: answers,
          press: switchScreen,
        );
      }
      );
    }
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = QuestionScreen(onSelectAnswer: answerQuestion);
        answers=[];
      },
    );
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 66, 25, 135),
        body: activeScreen,
      ),
    );
  }
}
