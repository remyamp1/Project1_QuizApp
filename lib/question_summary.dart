import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['questions_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}