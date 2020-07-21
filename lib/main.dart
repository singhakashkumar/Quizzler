import 'package:flutter/material.dart';
import 'quizBrain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.teal.shade700,
          appBar: AppBar(
            title: Text('Quizzler'),
            backgroundColor: Colors.teal.shade900,
          ),
          body: SafeArea(
            child: Padding(
//                padding: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userInputAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(
      () {
        if (correctAnswer == userInputAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quizBrain.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  "True",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                color: Colors.red,
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
