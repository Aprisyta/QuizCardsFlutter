import 'package:flutter/material.dart';

class NewCardScreen extends StatefulWidget {
  @override
  _NewAddCardScreenState createState() => _NewAddCardScreenState();
}

class _NewAddCardScreenState extends State<NewCardScreen> {

  final questionTextController = new TextEditingController();
//  final answerTextController = new TextEditingController();

  @override
  void dispose() {
    questionTextController.dispose();
//    answerTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 50.0),
            child: _questionFieldNewCardScreen(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 50.0),
//            child: _answerFieldNewCardScreen(),
          ),
//          _submitButtonNewDeckTab()
        ],
      ),
    );
  }

  Widget _questionFieldNewCardScreen() {
    return TextField(
      controller: questionTextController,
      textAlign: TextAlign.center,
      autocorrect: true,
      style: TextStyle(
          fontSize: 20.0,
          color: Colors.black
      ),
      decoration: InputDecoration(
          hintText: "Deck Title",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                  style: BorderStyle.solid
              )
          )
      ),
    );
  }
}
