import 'package:flutter/material.dart';
import 'package:triviaacademy/question.dart';
import 'package:triviaacademy/score_screen.dart';

class TriviaScreen extends StatefulWidget {
  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int answer = 0;
  int score = 0;
  int index = 0;
  List<Question> questionsList = Question.getQuestionList();

  void verifyResponse() {
    if (answer == questionsList[index].answer) {
      score++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff374952),
        title: Image(image: AssetImage('lib/assets/icon.png')),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 56, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PERGUNTA:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  questionsList[index].questionText,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: RadioListTile(
                    value: 1,
                    groupValue: answer,
                    title: Text(
                      questionsList[index].option1,
                      style: TextStyle(fontSize: 16),
                    ),
                    onChanged: (int value) => {
                      setState(() {
                        answer = value;
                      })
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: RadioListTile(
                    value: 2,
                    groupValue: answer,
                    title: Text(
                      questionsList[index].option2,
                      style: TextStyle(fontSize: 16),
                    ),
                    onChanged: (int value) => {
                      setState(() {
                        answer = value;
                      })
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: RadioListTile(
                    value: 3,
                    groupValue: answer,
                    title: Text(
                      questionsList[index].option3,
                      style: TextStyle(fontSize: 16),
                    ),
                    onChanged: (int value) => {
                      setState(() {
                        answer = value;
                      })
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: RadioListTile(
                    value: 4,
                    groupValue: answer,
                    title: Text(
                      questionsList[index].option4,
                      style: TextStyle(fontSize: 16),
                    ),
                    onChanged: (int value) => {
                      setState(() {
                        answer = value;
                      })
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 87,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  verifyResponse();
                  if (index < questionsList.length - 1) {
                    setState(() {
                      index++;
                      answer = 0;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScoreScreen(
                          maximum: questionsList.length,
                          result: score,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Responder',
                  style: TextStyle(fontSize: 18),
                ),
                color: Color(0xffDA0175),
                textColor: Color(0xffF7F7F7),
                padding: EdgeInsets.fromLTRB(60, 11, 60, 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
