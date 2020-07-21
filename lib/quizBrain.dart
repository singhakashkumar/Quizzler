import 'question.dart';
class QuizBrain{
  int _questionNumber=0;
  List<Question> _questionBank=[
    Question('Cyclones spin in a clockwise direction in the southern hemisphere', true),
    Question('Goldfish only have a memory of three seconds',false),
    Question('The capital of Libya is Benghazi',false),
    Question('Dolly Parton is the godmother of Miley Cyrus',true),
    Question('Roger Federer has won the most Wimbledon titles of any player',false),
    Question('An octopus has five hearts',false),
    Question('Brazil is the only country in the Americas to have the official language of Portuguese',true),
    Question('The Channel Tunnel is the longest rail tunnel in the world',false),
  ];
  String getQuestionText()
  {
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer()
  {
    return _questionBank[_questionNumber].questionAnswer;
  }
  int getNumberOfQuestion()
  {
    return _questionBank.length;
  }
  void nextQuestion()
  {
    _questionNumber=(_questionNumber+1)%getNumberOfQuestion();
  }
}
/*

True – Dolly is good friends with Miley’s dad, country star Billy Ray Cyrus
False – he has won 8, Martina Navratilova won 9
False – it has three
True
False –
 */