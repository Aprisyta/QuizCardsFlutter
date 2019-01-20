import '../model/card.dart';
import 'package:flutter/material.dart';

Positioned inactiveQuizCard (
    QuizCard card,
    BuildContext context,
    int index,
    ) {
  Size screenSize = MediaQuery.of(context).size;
  return new Positioned(
    child: new Card(
      color: Colors.red,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          )
      ),
      child: new Container(
        height: screenSize.height/2.0,
        alignment: Alignment.center,
        child: Text(
          "${card.question}",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
    ),
  );
}