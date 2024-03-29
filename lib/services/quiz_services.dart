import 'package:quiz_app/data/data_quiz.dart';

import '../models/question.dart';

final QuizServices quizServices = QuizServices();

class QuizServices {
  int index = 0;
  List<Question> questions = [];

  void init() {
    questions.addAll(questionBank);
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
    }
  }

  String showQuestion() {
    return questions[index].question;
  }

  bool getCorrectAnswer() {
    return questions[index].answer;
  }

  bool isFinished() {
    return index == questions.length - 1;
  }

  void restart() {
    index = 0;
  }
}
