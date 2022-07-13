// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
QuizBrain  quizBrain = QuizBrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text('True/False Quiz',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                )),
          ),
          backgroundColor: Color.fromARGB(255, 1, 45, 81),
        ),
        body: Quizpage(),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Widget> scorekeeper = [];

void checkAnswer(bool userPickedAnswer){
   bool correctanswer = quizBrain.getCorrectAnswer(questionNumber%16);
   setState(() {
                            if(userPickedAnswer== correctanswer)
                            {
                              scorekeeper.add(Icon( Icons.check, color: Colors.green));
                            }
                            else{
                              scorekeeper.add(Icon(Icons.close, color: Colors.red));
                            }
                            
                              questionNumber++;
                            });
}

  // List<String> questions = [
  //   'The Sky is Blue Blue',
  //   'Banana Leaf is Green ',
  //   'Ostrich can fly ',
  // ];
  // List<bool> answers = [
  //   true,
  //   true,
  //   false,

  // ];

// List<Question> questionBank=[
// Question(q: 'The Sky is Blue Blue', a: true),
// Question(q: 'Banana Leaf is Green', a: true),
// Question(q: 'Ostrich can fly', a: false),
// ];
  

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Center(
          child: Text(
            quizBrain.getQuestionText(questionNumber%16),
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: 200),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color.fromARGB(255, 29, 117, 3),
                                  Color.fromARGB(255, 15, 165, 33),
                                  Color.fromARGB(255, 15, 220, 0),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {

                            checkAnswer(true);
                            
                          },
                          child: const Text(
                            'TRUE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color.fromARGB(255, 145, 0, 0),
                                  Color.fromARGB(255, 216, 0, 0),
                                  Color.fromARGB(255, 245, 66, 66),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            checkAnswer(false);
                          },
                          child: const Text(
                            'FALSE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
