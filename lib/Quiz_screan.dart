import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'model.dart';

// ignore: must_be_immutable
class Quiz_screan extends StatefulWidget {
  Quiz_screan({super.key, required this.index});
  int index;

  @override
  State<Quiz_screan> createState() => _Quiz_screanState();
}

class _Quiz_screanState extends State<Quiz_screan> {
  int? SelectIndex;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          //Quiz App
          Text("Quiz App", style: TextStyle(fontSize: 25, color: Colors.white)),

          Gap(50),
          //Question 2/4
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Question ${widget.index + 1}/${listAnswers.length}",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),

          Gap(50),
          //Question????????
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
                margin: EdgeInsets.all(10),
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  textAlign: TextAlign.center,
                  listAnswers[widget.index].question,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              Positioned(
                top: -10,
                left: MediaQuery.of(context).size.width / 2 - 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.check, color: Colors.green, size: 25),
                ),
              ),
              Positioned(
                top: 30,
                left: -14,
                child: CircleAvatar(backgroundColor: Colors.black, radius: 20),
              ),
              Positioned(
                top: 30,
                right: -14,
                child: CircleAvatar(backgroundColor: Colors.black, radius: 20),
              ),
            ],
          ),

          Gap(10),
          //Ansars
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listAnswers[widget.index].answer.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    SelectIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    color: SelectIndex == index ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    listAnswers[widget.index].answer.keys.toList()[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: SelectIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),

          Spacer(),
          //NEXST
          GestureDetector(
            onTap: () {
              setState(() {
                listAnswers[widget.index].answer.values
                            .toList()[SelectIndex!] ==
                        true
                    ? score++
                    : score;
                if (widget.index < listAnswers.length - 1) {
                  SelectIndex == null;
                  widget.index++;
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AboutDialog(
                        children: [
                          Text("your score is $score"),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  widget.index < listAnswers.length - 1 ? "N E X T" : "Submit",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}
