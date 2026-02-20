import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'model.dart';

class QuizScreen extends StatefulWidget {
  final int initialIndex;
  const QuizScreen({super.key, required this.initialIndex});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int currentIndex;
  int? selectedIndex;
  int score = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = listAnswers[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            "Quiz App",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Question ${currentIndex + 1}/${listAnswers.length}",
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
          const Gap(50),

          // Question Card
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 20,
                ),
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.help_outline,
                      color: Colors.orange,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Gap(10),

          // Answers List
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: currentQuestion.answer.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50,
                  ),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    currentQuestion.answer.keys.toList()[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),

          const Spacer(),

          // Next / Submit Button
          GestureDetector(
            onTap: () {
              if (selectedIndex == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please select an answer first!"),
                  ),
                );
                return;
              }

              setState(() {
                bool isCorrect = currentQuestion.answer.values
                    .toList()[selectedIndex!];
                if (isCorrect) score++;

                if (currentIndex < listAnswers.length - 1) {
                  currentIndex++;
                  selectedIndex = null;
                } else {
                  _showResultDialog();
                }
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  currentIndex < listAnswers.length - 1 ? "N E X T" : "Submit",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your score is $score / ${listAnswers.length}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
