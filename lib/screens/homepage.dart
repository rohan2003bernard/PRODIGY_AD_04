import 'package:flutter/material.dart';
import 'package:tictactoe/screens/gamescreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController player1 = TextEditingController();
  final TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        padding: EdgeInsets.only(top: ht * 0.15, left: 20, right: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Text(
                'Enter player name:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  TextFormField(
                    controller: player1,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Color(0xFFCFB737),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Enter player 1 name',
                      hintStyle: TextStyle(
                          color: Colors.white, fontFamily: 'SF Pro Display'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter player 1 name";
                      }
                      return null;
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Column(
                children: [
                  TextFormField(
                    controller: player2,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Color(0xFFCFB737),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Enter player 2 name',
                      hintStyle: TextStyle(
                          color: Colors.white, fontFamily: 'SF Pro Display'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter player 2 name";
                      }
                      return null;
                    },
                  )
                ],
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(
                          player1: player1.text,
                          player2: player2.text,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0xFF40C946),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
