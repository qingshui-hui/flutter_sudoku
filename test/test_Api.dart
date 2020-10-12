import 'package:flutter_sudoku/Api.dart';

void main() async {
  var problems = await Api.fetchProblemList();
  print(problems);
  print(problems[0]['nums']);
}