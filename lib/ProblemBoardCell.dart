import 'package:flutter/material.dart';

class ProblemBoardCell extends StatelessWidget {
  ProblemBoardCell({
    @required this.index,
    @required this.number,
    @required this.selected,
  });

  final index;
  final int number;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(number == 0 ? '' : number.toString()),
      decoration: BoxDecoration(
        color: selected ? Colors.lightBlueAccent : null,
        border: Border(
          top: BorderSide(
              color: index[0] % 3 == 0 ? Colors.black : Colors.grey,
              width: 0.5),
          left: BorderSide(
              color: index[1] % 3 == 0 ? Colors.black : Colors.grey,
              width: 0.5),
          bottom: BorderSide(
              color: index[0] == 8 ? Colors.black : Colors.grey, width: 0.5),
          right: BorderSide(
              color: index[1] == 8 ? Colors.black : Colors.grey, width: 0.5),
        ),
      ),
      width: 40,
      height: 40,
    );
  }
}
