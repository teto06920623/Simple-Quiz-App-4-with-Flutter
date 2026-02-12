class Model {
  final String question;
  final Map<String, bool> answer;

  Model({required this.question, required this.answer});
}

List<Model> listAnswers = [
  // Question 1: Flutter Basics
  Model(
    question: "Who developed Flutter?",
    answer: {
      "Facebook": false,
      "Google": true,
      "Microsoft": false,
      "Apple": false,
    },
  ),

  // Question 2: Programming Logic
  Model(
    question: "Which language is used in Flutter?",
    answer: {"Java": false, "Kotlin": false, "Dart": true, "Swift": false},
  ),

  // Question 3: Technical Concept
  Model(
    question: "What is a Widget in Flutter?",
    answer: {
      "A database": false,
      "A UI component": true,
      "A backend server": false,
      "An operating system": false,
    },
  ),

  // Question 4: General Logic
  Model(
    question: "Which of these is NOT a loop?",
    answer: {
      "For": false,
      "While": false,
      "If": true, // If is a condition, not a loop
      "Do-While": false,
    },
  ),
];
