
import 'question_model.dart';
class Question extends QuestionModel {

  List<QuestionModel> questions = [
    QuestionModel(question: 'Firstly tell us is your age +18?',
        choices: ['Yes', 'No'],
        icon: 'assets/images/plus-18-movie.svg'),
    QuestionModel(question: 'Are you watching with your family?',
        choices: ['Yes', 'No'],
        icon: 'assets/images/family(1).svg'),
    QuestionModel(question: 'What kind of movies you like to watch?',
        choices: [
          'Comedy',
          'Action',
          'Adventure',
          'SCI-FI',
          'Romantic',
          'Horror'
        ],
        icon: 'assets/images/clapperboard.svg')
  ];
}