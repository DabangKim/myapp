import 'package:flutter/material.dart';
import 'package:mbti_app/answer_model.dart';
import 'package:mbti_app/question_box.dart';
import 'package:mbti_app/question_model.dart';
import 'package:mbti_app/result_page.dart';

class MbtiTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 25,
              height: 25,
            ),
            Container(width: 10),
            Text(
              "MBTI 검사 앱",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              _buildHeader(),
              for (var question in questions) QuestionBox(question: question),
            ],
          ),
          GestureDetector(
            onTap: () {
              // 답변을 전부 하지 않은 경우, 코드가 실행되지 않도록 방지
              if (allSelectedAnswers.length != questions.length) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("모든 문제를 답변해주세요."),
                  ),
                );
                return;
              }
              // MBTI 결과 받아오기
              final String mbti = calculateMBTI(
                questions,
                allSelectedAnswers.values.toList(),
              );
              print(mbti);

              // MBTI 결과 페이지로 이동
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ResultPage(result: mbti);
                  },
                ),
              );
            },
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(color: Colors.purple),
                  child: Center(
                    child: Text(
                      "결과 보기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color(0xFF33A474),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "MBTI 테스트",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "MBTI Testing App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Container(height: 20),
          Container(
            height: 1,
            color: Colors.white10,
          ),
          Container(height: 20),
          // 가이드 박스 삽입하기
          _box(
            'assets/header_icon1.png',
            '자신의 성격 유형을 확인할 수 있도록 솔직하게 답변해주세요.',
          ),
          Container(height: 10),
          _box(
            'assets/header_icon2.png',
            '자신의 성격 유형이 삶의 여러 영역에 어떤 영향을 미치는지 알아보세요.',
          ),
          Container(height: 10),
          _box(
            'assets/header_icon3.png',
            '프리미엄 자료로 원하는 삶으로 성장하세요.',
          ),
        ],
      ),
    );
  }

  Container _box(String imagePath, String text) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFDEECE7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          Container(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
