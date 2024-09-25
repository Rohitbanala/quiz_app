import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  const answerButton({
    required this.answer,
    super.key,
    required this.onPressed,
  });
final String answer;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 34, 10, 123),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      ),
      child: Text(
        answer,textAlign: TextAlign.center,
      ),
    );
  }
}
