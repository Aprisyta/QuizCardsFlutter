import 'dart:math';
import '../model/card.dart';
import 'package:flutter/material.dart';

//double bottom;
//double cardWidth;
//double skew;
//int flag;
//Function swipeRight;
//Function swipeLeft;

Positioned activeQuizCard (
    QuizCard card,
    BuildContext context,
    double right,
    double left,
    double rotation,
    double skew,
    int index,
    Function dismissCard,
    ) {
  Size screenSize = MediaQuery.of(context).size;
  return new Positioned(
    child: new Dismissible(
      key: Key(index.toString()),
      onDismissed: (DismissDirection direction) {
        dismissCard();
      },
      child: Transform(
        child: RotationTransition (
          turns: AlwaysStoppedAnimation(rotation/360),
          child: Hero(
            tag: index.toString(),
            child: GestureDetector(
              onTap: () {
              //  flip card
              },
              child: new Card(
                color: Colors.red,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
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
            ),
          ),
        ) ,
        transform: Matrix4.skewX(skew),
      ),
    ),
  );
}