// AnswerType enum을 만들어보기

enum AnswerType {
  strongYes,
  yes,
  littleYes,
  neutral,
  littleNo,
  no,
  strongNo,
}

// 지금까지 선택한 답변들
// - 키: Question ID
// - 값: 답변
Map<String, AnswerType> allSelectedAnswers = {};