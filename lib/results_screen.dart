import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers,required this.press});
  final List<String> choosenAnswers;
  final void Function() press;
  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question Num': i,
        'question': questions[i].question,
        'answer': questions[i].answers[0],
        'choosen': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData();
    var totalQuestions = questions.length;
    var correctQuestions = summary.where((data) {
      return data['answer']==data['choosen'];
    },).length;
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answers $correctQuestions questions in $totalQuestions correctly",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(itemdata: summary,),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: press,
            child: const Text(
              "Restart Quiz!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
