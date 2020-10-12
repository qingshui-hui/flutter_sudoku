import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BoardPage.dart';
import 'Problem.dart';

class IndexPage extends StatelessWidget {
  var problems;

  IndexPage(problems) {
    this.problems = problems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Problem List"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: problems.map<Widget>((problem) {
            return Container(
              margin: EdgeInsets.only(left: 20),
              width: 40,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BoardPage(
                          title: 'Problem ${problem['key']}',
                          problem: Problem.makeProblemData(problem['nums']),
                        );
                      },
                    ),
                  );
                },
                child: Text(problem['key']),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
