import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_sudoku/Problem.dart';

fetchData() async {
  var problem = Problem.get("1");
  var numberProblem = problem.map((row) {
    return row.map((cell) => cell["number"]).toList();
  }).toList();
  var jsonProblem = JsonEncoder().convert(numberProblem);
  var response = await http.get(
      'https://ok8zvqc5ti.execute-api.ap-northeast-1.amazonaws.com/prod/solve?problem=$jsonProblem');
  print(JsonDecoder().convert(response.body));
}

void main() {
  print("aaa");
  fetchData();
}
