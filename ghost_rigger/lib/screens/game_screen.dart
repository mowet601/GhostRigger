import 'package:flutter/material.dart';
import 'package:ghost_rigger/screens/hacking_device.dart';

import '../audio.dart';
import '../main.dart';
import 'models/piece_model.dart';
import 'models/puzzle_model.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Widget build(context) {
    var validCellPositions = [
      [1, 2], [1, 3], [1, 4],
      [2, 2], [2, 3], [2, 4],
    ];
    var pieceModels = [
      PieceModel(isInOrOut: true, arithmeticValue: 3, positionInBoardRow: 2, positionInBoardColumn: 1),
      PieceModel(isInOrOut: true, positionInBoardRow: 1, positionInBoardColumn: 5),
      PieceModel(hastLeftCable: true, hastRightCable: true),
      PieceModel(hastBottomCable: true, hastRightCable: true, arithmeticValue: 1, arithmeticOperation: ArithmeticOperation.add),
      PieceModel(hastLeftCable: true, hastRightCable: true, arithmeticValue: 2, arithmeticOperation: ArithmeticOperation.multiply),
      PieceModel(hastLeftCable: true, hastTopCable: true),
    ];
    var puzzle = PuzzleModel(validCellPositions, pieceModels, 8);

    Main.game = HackingDevice(puzzle,() {
      Main.game = null;
      Audio.play(Song.MENU);
      Navigator.pop(context);
    });
    Audio.play(Song.GAME);
    return Main.game.widget;
  }
}
