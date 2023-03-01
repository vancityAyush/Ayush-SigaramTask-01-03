import 'dart:collection';

import 'package:flutter/material.dart';

class MatrixGameBloc {
  final int size;
  final List<MatrixItem> matrix = [];
  final Queue<MatrixItem> queue = Queue();
  int count = 0;

  MatrixGameBloc({required this.size}) {
    generateList();
  }

  onTap(int index) {
    if (queue.length == 2) {
      MatrixItem first = queue.removeFirst();
      first.color = Colors.blue;
    }
    MatrixItem item = matrix[index];
    item.color = Colors.red;
    item.value = ++count;
    queue.add(matrix[index]);
  }

  generateList() {
    for (int i = 0; i < size * size; i++) {
      matrix.add(MatrixItem(value: null, color: Colors.blue));
    }
  }
}

class MatrixItem {
  int? value;
  Color color;
  MatrixItem({this.value, required this.color});
}
