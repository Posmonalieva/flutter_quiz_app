import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_h_work6/brain_quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> icons = [];

  BrainQuiz brainQuiz = BrainQuiz();

  @override
  void initState() {
    brainQuiz.fillQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    brainQuiz.showQuestion(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      userClicked(true);
                    },
                    child: const Text(
                      'TRUE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 80,
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      userClicked(false);
                    },
                    child: const Text(
                      'FALSE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  children: icons,
                  //]
                  // Icon(
                  //   Icons.check,
                  //   color: Colors.white,
                  //   size: 30,
                  // ),
                  // Icon(
                  //   Icons.close,
                  //   color: Colors.red,
                  //   size: 30,
                  // ),
                  //],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Суроолор бутту!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Кайрадан башта!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                kayradanBashta();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void kayradanBashta() {
    icons.clear();
    //icons = [];

    brainQuiz.restart();
    setState(() {});
  }

  void userClicked(bool usersAnswer) {
    bool akyrkySuroobu = brainQuiz.isLastQuestion();
    bool tuuraJoop = brainQuiz.getCorrectAnswer();

    log('userClicked akyrkySuroobu: $akyrkySuroobu');

    if (akyrkySuroobu) {
      log('userCliked akyrkySuroobu tuura: $akyrkySuroobu');
      _showMyDialog();
    } else {
      // log('userClicked tuuraJoop: $tuuraJoop');
      if (usersAnswer == tuuraJoop) {
        // log('userclicked tuura joop berdi');
        icons.add(
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 30,
          ),
        );
      } else {
        log('userclicked kata joop berdi');
        icons.add(
          const Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
        );
      }
      brainQuiz.getNextQuestion();
    }

    // log('userClicked userAnswer: $usersAnswer');

    setState(() {});
  }

  void clickRightIcon() {
    brainQuiz.getNextQuestion();
    //  icons.add(
    //   const Icon(
    //     Icons.check,
    //     color: Colors.white,
    //     size: 30,
    //   ),
    // );
    setState(() {});
  }

  void clickUnRightIcon() {
    brainQuiz.getNextQuestion();
    // icons.add(
    //   const Icon(
    //     Icons.close,
    //     color: Colors.white,
    //     size: 30,
    //   ),
    // );
    setState(() {});
  }
}
