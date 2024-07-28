import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  GameScreen({super.key, required this.player1, required this.player2});
  String player1;
  String player2;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> _board;
  late String _currentplayer;
  late String _winner;
  late bool _gameOver;

  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentplayer = "X";
    _winner = "";
    _gameOver = false;
  }

  void resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentplayer = "X";
      _winner = "";
      _gameOver = false;
    });
  }

  void makemove(int row, int col) {
    if (_board[row][col] != "" || _gameOver) {
      return;
    }

    setState(() {
      _board[row][col] = _currentplayer;
    });

    if (_board[row][0] == _currentplayer &&
        _board[row][1] == _currentplayer &&
        _board[row][2] == _currentplayer) {
      _winner = _currentplayer;
      _gameOver = true;
    } else if (_board[0][col] == _currentplayer &&
        _board[1][col] == _currentplayer &&
        _board[2][col] == _currentplayer) {
      _winner = _currentplayer;
      _gameOver = true;
    } else if (_board[0][0] == _currentplayer &&
        _board[1][1] == _currentplayer &&
        _board[2][2] == _currentplayer) {
      _winner = _currentplayer;
      _gameOver = true;
    } else if (_board[0][2] == _currentplayer &&
        _board[1][1] == _currentplayer &&
        _board[2][0] == _currentplayer) {
      _winner = _currentplayer;
      _gameOver = true;
    }

    if (!_gameOver) {
      _currentplayer = _currentplayer == "X" ? "O" : "X";

      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _gameOver = true;
        _winner = "It's a tie";
      }
    }

    if (_winner != "") {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          btnOkText: "Play Again",
          title: _winner == "X"
              ? widget.player1 + " Won!"
              : _winner == "O"
                  ? widget.player2 + " Won!"
                  : "It's a Tie",
          btnOkOnPress: () {
            resetGame();
          })
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TIC TAC TOE',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 35,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        backgroundColor: Color(0xFFCDED4A),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFDCD759),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Turn : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  _currentplayer == "X" ? widget.player1 : widget.player2,
                  style: TextStyle(
                    color: _currentplayer == "X" ? Colors.green : Colors.red,
                    fontSize: 34,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
            Container(
              decoration: ShapeDecoration(
                color: Color(0xFF929063),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
              ),
              child: GridView.builder(
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    int row = index ~/ 3;
                    int col = index % 3;
                    return GestureDetector(
                      onTap: () => makemove(row, col),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            _board[row][col],
                            style: TextStyle(
                              color: _board[row][col] == "X"
                                  ? Color(0xFF3CC21A)
                                  : Color(0xFFC21A1A),
                              fontSize: 100,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
