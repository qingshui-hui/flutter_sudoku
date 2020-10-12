import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'IndexPage.dart';
import 'ProblemBoardCell.dart';
import 'Api.dart';

class BoardPage extends StatefulWidget {
  BoardPage({Key key, this.title, this.problem}) : super(key: key);

  final String title;
  final problem;

  @override
  _BoardPageState createState() => _BoardPageState(problem: this.problem);
}

class _BoardPageState extends State<BoardPage> {
  _BoardPageState({@required this.problem});

  final problem;

  var selectedCellIndex = [0, 0];

  void _selectCell(index) {
    setState(() {
      selectedCellIndex = List<int>.from(index);
      print(selectedCellIndex);
    });
  }

  void _putNumberOnCell(number) {
    setState(() {
      problem[selectedCellIndex[0]][selectedCellIndex[1]]['number'] = number;
    });
  }

  void _solve() async {
    var response = await Api.solve(problem);
    setState(() {
      response['solution'].asMap().forEach((i, row) {
        row.asMap().forEach((j, num) {
          problem[i][j]['number'] = num;
        });
      });
    });
  }

  fetchProblems() async {
    var problems = await Api.fetchProblemList();
    return problems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          FlatButton(
            onPressed: () async {
              var problems = await fetchProblems();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndexPage(problems)),
              );
            },
            child: Text('PL'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              children: problem
                  .map<Widget>((problemRow) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: problemRow
                            .map<Widget>((cell) => GestureDetector(
                                  onTap: () {
                                    _selectCell(cell['index']);
                                  },
                                  child: ProblemBoardCell(
                                    index: cell['index'],
                                    number: cell['number'],
                                    selected: ListEquality().equals(
                                      selectedCellIndex,
                                      List<int>.from(cell['index']),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ))
                  .toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (var i = 0; i < 10; i += 1) i].map((number) {
                return SizedBox(
                  width: 30,
                  child: FlatButton(
                    onPressed: () {
                      _putNumberOnCell(number);
                    },
                    child: Text(number.toString()),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    _solve();
                  },
                  child: Text("Solve"),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
