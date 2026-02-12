import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz_screan.dart';
import 'package:quiz_app/model.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: listAnswers.length,
        itemBuilder: (context, index) {
          return Quiz_screan(index: index);
        },
      ),
    );
  }
}
