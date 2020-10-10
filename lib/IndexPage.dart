import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BoardPage.dart';
import 'Problem.dart';

class IndexPage extends StatelessWidget {
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
          children: ["1", "2"].map<Widget>((code) {
            return Container(
              margin: EdgeInsets.only(left: 20),
              width: 40,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BoardPage(
                        title: 'Problem $code',
                        problem: Problem.get(code),
                      ),
                    ),
                  );
                },
                child: Text(code),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
