import 'package:flutter/material.dart';

import 'matrix_game_bloc.dart';

class MatrixGame extends StatefulWidget {
  const MatrixGame({Key? key}) : super(key: key);

  @override
  State<MatrixGame> createState() => _MatrixGameState();
}

class _MatrixGameState extends State<MatrixGame> {
  final MatrixGameBloc bloc = MatrixGameBloc(size: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Game'),
      ),
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: bloc.size,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            for (MatrixItem item in bloc.matrix)
              GestureDetector(
                onTap: () {
                  bloc.onTap(bloc.matrix.indexOf(item));
                  setState(() {});
                },
                child: Container(
                  color: item.color,
                  child: Center(
                    child:
                        item.value != null ? Text("Box #${item.value}") : null,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
