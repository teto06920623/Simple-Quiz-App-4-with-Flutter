import 'package:flutter/material.dart';
import 'page_view.dart';

class SplashScrean extends StatefulWidget {
  const SplashScrean({super.key});

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => PageViewScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          spacing: 50,
          children: [
            Spacer(),
            Image.asset("images/QuizApp.png"),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
