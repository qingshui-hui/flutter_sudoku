import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static solve(problem) async {
    var numberProblem = problem.map((row) {
      return row.map((cell) => cell["number"]).toList();
    }).toList();
    var jsonProblem = JsonEncoder().convert(numberProblem);
    var response = await http.get(
        'https://ok8zvqc5ti.execute-api.ap-northeast-1.amazonaws.com/prod/solve?problem=$jsonProblem');
    var decoded = JsonDecoder().convert(response.body);
    return decoded;
  }

  static fetchProblemList() async {
    var response = await http.get(
        'https://ok8zvqc5ti.execute-api.ap-northeast-1.amazonaws.com/prod/get_problems?method=list');
    var decoded = JsonDecoder().convert(response.body);
    return decoded;
  }
}
