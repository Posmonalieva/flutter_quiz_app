// import 'dart:math';

import 'dart:developer';

import 'package:flutter_h_work6/question.dart';
import 'package:flutter_h_work6/quiz_data.dart';

class BrainQuiz {
  int index = 0;
  List<Question> questions = [];

  void fillQuestion() {
    questions.addAll(suroolor);
  }

  void getNextQuestion() {
    // print('1 getNextQuestion index: $index');
    if (index < questions.length - 1) {
      index++;
    }

    // print('2 getNextQuestion index: $index');
  }

  String showQuestion() {
    log('showQuestion index: $index');
    return questions[index].question;
  }

  String getQuestion() {
    if (index < questions.length) {
      return questions[index].question;
    } else {
      return 'buttu';
    }
  }

  // bool getCorrectAnswer() {
  //   log('getCorrectAnswer index: $index');
  //   return questions[index].answer;

  // }

  bool getCorrectAnswer() {
      return questions[index].answer;
    } 
  }

  bool iSLastQuestion() {
    if(index == questions.length-1) {
      return true;
    }else {
      return false;
    }
  }

  // bool isFinished() {
  //   if (index == questions.length - 1) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  void restart() {
    index = 0;
  }
  }

final BrainQuiz quizBrain = BrainQuiz();
