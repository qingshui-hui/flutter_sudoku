class Problem {
  static get(String problemCode) {
    return makeProblemData(problems[problemCode]);
  }

  static var problems = {
    "1": [
      [0, 0, 2, 0, 0, 0, 3, 0, 0],
      [0, 0, 0, 4, 0, 7, 0, 6, 0],
      [7, 0, 0, 0, 1, 0, 0, 0, 2],
      [0, 1, 0, 5, 0, 2, 0, 4, 0],
      [0, 0, 6, 0, 0, 0, 8, 0, 0],
      [0, 9, 0, 7, 0, 1, 0, 5, 0],
      [3, 0, 0, 0, 4, 0, 0, 0, 6],
      [0, 4, 0, 3, 0, 5, 0, 0, 0],
      [0, 0, 5, 0, 0, 0, 1, 0, 0],
    ],
    "2": [
      [8, 0, 0, 0, 0, 0, 5, 0, 2],
      [0, 0, 0, 0, 4, 0, 0, 6, 0],
      [0, 0, 0, 9, 0, 6, 0, 0, 4],
      [0, 0, 2, 3, 0, 7, 1, 0, 0],
      [0, 5, 0, 0, 0, 0, 0, 3, 0],
      [0, 0, 4, 1, 0, 2, 6, 0, 0],
      [2, 0, 0, 6, 0, 1, 0, 0, 0],
      [0, 3, 0, 0, 8, 0, 0, 0, 0],
      [1, 0, 8, 0, 0, 0, 0, 0, 5],
    ],
  };

  static makeProblemData(problem) {
    var data = [];
    problem.asMap().forEach((i, row) {
      var dataRow = [];
      row.asMap().forEach((j, number) {
        dataRow.add({
          'number': number,
          'index': [i, j],
          'selected': false,
        });
      });
      data.add(dataRow);
    });
    return data;
  }
}
