import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;



  List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
  

  //Fetch quiz questions from Firestore

  /*static Future<List<QuizQuestion>> fetchQuestionsFromFirebase() async{
    final snapshot = await FirebaseFirestore.instance
    .collection('quizes')
    .get(); */

  //  return snapshot.docs.map((doc){
   //   final data = doc.data() as Map<String, dynamic>;
      
     /* final String questionText =data['questions'] ?? ' question available';
      final List<String> answers =(data['answers'] is List)
      ?(data['answers'] as List<dynamic>).map((answer)=> answer.toString()).toList()
     : [' answers available']; */
      
   


     /* return QuizQuestion(
      questionText,answers
      );
    }).toList(); */
 // }
}