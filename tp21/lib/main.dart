import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Questions/Réponses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: "Questions/Réponses"),
      ),
    );
  }
}

class Question {
  String question;
  bool answer;
  Question({required this.question, required this.answer});
}

class MyHomePage extends StatelessWidget {
  final String title;
  var questions = [
    Question(
        question: "Est-ce que cette planette est bien la planète Terre ?",
        answer: true),
    Question(
        question: "La planète Terre est la plus proche planète au Soleil",
        answer: false),
    Question(
        question:
            "La planète Terre est la plus grande planète du système solaire",
        answer: false),
    Question(
        question:
            "L'étoile Sirius de la Constellation du Grand Chien est l'étoile la plus brillante vue de Terre",
        answer: true),
    Question(
        question:
            "Les océans et les mers ne forment que le un tier de la planète Terre",
        answer: false),
    Question(
        question: "Vénus est la planète la plus proche à la planète Terre",
        answer: true)
  ];

  MyHomePage({required this.title});

  void _incrementScore(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementScore();
  }

  void _nextQuestion(BuildContext context, int n) {
    Provider.of<Counter>(context, listen: false).incrementCounter(context, n);
  }

  void _check(bool answer, bool rightanswer, BuildContext context) {
    var _answred = Provider.of<Counter>(context, listen: false).getAnswered;
    Provider.of<Counter>(context, listen: false).setAnswered(!_answred);
    if (answer == rightanswer) {
      _RightAnswer(context);
    } else {
      _WrongAnswer(context);
    }
  }

  void _RightAnswer(BuildContext context) {
    _incrementScore(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Bonne réponse !"),
    ));
  }

  void _WrongAnswer(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Oups, raté !"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of<Counter>(context).getCounter;
    var _score = Provider.of<Counter>(context).getScore;
    var _answred = Provider.of<Counter>(context).getAnswered;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          " Questions / Réponses",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[100],
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    'Question ${_counter + 1} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )),
            Positioned(
              top: 55,
              child: Container(
                width: MediaQuery.of(context).size.width / 10 * 9,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 3,
                    ),
                    shape: BoxShape.rectangle),
              ),
            ),
            Positioned(
              top: 350,
              width: MediaQuery.of(context).size.width / 10 * 9,
              height: 150,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${questions[_counter].question} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 540,
                width: MediaQuery.of(context).size.width / 10 * 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () => _answred == true
                          ? null
                          : _check(true, questions[_counter].answer, context),
                      child: Column(
                        children: [
                          Icon(Icons.thumb_up, color: Colors.deepPurple),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Vrai',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () => _answred == true
                          ? null
                          : _check(false, questions[_counter].answer, context),
                      child: Column(
                        children: [
                          Icon(Icons.thumb_down, color: Colors.deepPurple),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            color: Colors.white,
                            child: Text(
                              'Faux',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _nextQuestion(context, questions.length),
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int _counter = 0;
  int _score = 0;
  bool answered = false;

  int get getCounter => _counter;

  int get getScore => _score;

  bool get getAnswered => answered;

  void incrementCounter(BuildContext context, int n) {
    if (_counter == n - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(),
          settings: RouteSettings(
            arguments: _score,
          ),
        ),
      );
      _counter = 0;
      _score = 0;
    } else {
      _counter++;
    }
    answered = false;
    notifyListeners();
  }

  void incrementScore() {
    _score += 1;
    notifyListeners();
  }

  void setAnswered(bool bool) {
    answered = bool;
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _score = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          " Résulats ",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width / 10 * 9,
              height: MediaQuery.of(context).size.height / 3,
              child: Text(
                "Bravo! Vous avez terminé le quizz. \n",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              top: -200,
            ),
            Positioned(
              width: MediaQuery.of(context).size.width / 10 * 9,
              height: MediaQuery.of(context).size.height / 3,
              child: Text(
                "Votre score est : \t $_score",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              top: -100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, onPrimary: Colors.white),
              child: const Text('Recommencer'),
            ),
          ],
        ),
      ),
    );
  }
}
