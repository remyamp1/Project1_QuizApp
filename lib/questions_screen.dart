import 'package:flutter/material.dart';

import 'package:quizapp/answer_button.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
 // List<QuizQuestion> questions =[];

 /* @override
  void initState(){
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async{
    try {
    final fetchedQuestions = await QuizQuestion.fetchQuestionsFromFirebase();
    setState(() {
      questions=fetchedQuestions;
    });
    } catch (e){
      print('error fetching question:$e');
    }
  } */

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {


    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style:TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                
                text: answer,
                  onTap: (){
                    answerQuestion(answer);
                  },
                
              );
            })
          ],
        ),
      ),
    );
  }
}