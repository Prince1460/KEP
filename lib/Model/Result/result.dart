class Result {
  late int total;
  late int correct;
  late int wrong;

  int getCorrectAns() {
    return correct;
  }

  int getWrongAns() {
    return wrong;
  }

  int notAttempted() {
    return total - correct - wrong;
  }

  double percentage() {
    return ((correct / total) * 100);
  }

  int getTotalQuestions() {
    return total;
  }
}
