// question box 위젯

import 'package:flutter/material.dart';
import 'package:mbti_app/answer_model.dart';
import 'package:mbti_app/question_model.dart';

class QuestionBox extends StatefulWidget {
  const QuestionBox({super.key, required this.question});

  final Question question;

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox>
  with AutomaticKeepAliveClientMixin{
  AnswerType? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.question.text,
                // "단순하고 직관적인 아이디어보다는 복잡하고 참신한 아이디어에 흥미를 느낀다",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAnswerButton(50, Color(0xFF33A474), AnswerType.strongYes),
                _buildAnswerButton(40, Color(0xFF33A474), AnswerType.yes),
                _buildAnswerButton(30, Color(0xFF33A474), AnswerType.littleYes),
                _buildAnswerButton(20, Colors.grey, AnswerType.neutral),
                _buildAnswerButton(30, Color(0xFF88619A), AnswerType.littleNo),
                _buildAnswerButton(40, Color(0xFF88619A), AnswerType.no),
                _buildAnswerButton(50, Color(0xFF88619A), AnswerType.strongNo),
              ],
            ),

            Container(height: 10),

            // 그렇다, 아니다
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "그렇다",
                  style: TextStyle(color: Color(0xFF33A474),
                  fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 10),
                Text(
                  "아니다",
                  style: TextStyle(color: Color(0xFF88619A),
                  fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ],
        )
    );
  }

  Widget _buildAnswerButton(double size, Color color, AnswerType answerType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAnswer = answerType;
          print(_selectedAnswer);

          // 내가 선택한 답변을 allSelectedAnswer에 넣어준다
          allSelectedAnswers[widget.question.id] = answerType;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: (_selectedAnswer == answerType) ? color : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
      ),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
