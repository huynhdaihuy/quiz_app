import 'package:flutter/material.dart';

class SummaryQuest extends StatelessWidget {
  const SummaryQuest({super.key, required this.summaryList});
  final List<Map<String, Object>> summaryList;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryList.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: data['correct_question'] == data['user_answer']
                          ? const Color.fromARGB(255, 150, 198, 241)
                          : const Color.fromARGB(255, 249, 133, 241),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 234, 233, 236),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['correct_question'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(197, 255, 255, 255),
                              fontSize: 18)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(164, 28, 172, 216),
                              fontSize: 18)),
                      const SizedBox(
                        height: 5,
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
