import 'dart:math';
import '../model/card.dart';
import 'package:flutter/material.dart';

Positioned activeCard (
    QuizCard card,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissCard,
    int flag,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;
  return new Positioned(
    bottom: 100.0 + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {},
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          dismissCard(card);
//        else
//          addImg(img);
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: new Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: new Hero(
            tag: "img",
            child: new GestureDetector(
              onTap: () {
                print("Hi");
              },
              child: new Card(
                color: Colors.transparent,
                elevation: 4.0,
                child: new Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7,
                  decoration: new BoxDecoration(
                    color: new Color.fromRGBO(121, 114, 173, 1.0),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height: screenSize.height / 2.2,
                        child: Text(card.question),
                        alignment: Alignment.center,
                      ),
                      new Container(
                          width: screenSize.width / 1.2 + cardWidth,
                          height:
                          screenSize.height / 1.7 - screenSize.height / 2.2,
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeLeft();
                                  },
                                  child: new Container(
                                    height: 60.0,
                                    width: 130.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                      new BorderRadius.circular(60.0),
                                    ),
                                    child: new Text(
                                      "DON'T",
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  )),
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeRight();
                                  },
                                  child: new Container(
                                    height: 60.0,
                                    width: 130.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius:
                                      new BorderRadius.circular(60.0),
                                    ),
                                    child: new Text(
                                      "I'M IN",
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
//import 'dart:math';
//import 'package:flutter/material.dart';
//import '../model/card.dart';
//
//Positioned activeCard (
//  QuizCard card,
//  double bottom,
//  double right,
//  double left,
//  double cardWidth,
//  double rotation,
//  double skew,
//  BuildContext context,
//  Function dismissCard,
//  int flag,
//  Function swipeRight,
//  Function swipeLeft
//) {
//  Size screenSize = MediaQuery.of(context).size;
//  print(card.question);
//  return new Positioned(
//    bottom: 100.0 + bottom,
//    right: flag == 0 ? right != 0.0 ? right : null : null,
//    left: flag == 1 ? right != 0.0 ? right : null : null,
//    child: new Dismissible(
//      key: new Key(new Random().toString()),
//      crossAxisEndOffset: -0.3,
//      onDismissed: (DismissDirection direction) {
//        if (direction == DismissDirection.endToStart){
//          print("Inside onDismissed");
//          dismissCard(card);
//        }
//
////        else
////          addImg(img);
//      },
//      child: new Transform(
//        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
//        transform: new Matrix4.skewX(skew),
//        child: new RotationTransition(
//          turns: new AlwaysStoppedAnimation(
//              flag == 0 ? rotation / 360 : -rotation / 360
//          ),
//          child: new Hero(
//            tag: "card",
//            child: new GestureDetector(
//              onTap: () {
//                print("Hi");
//                // flip card
//              },
//              child: new Card(
//                color: Colors.transparent,
//                elevation: 4.0,
//                child: new Container(
//                  alignment: Alignment.center,
//                  width: screenSize.width / 1.2 + cardWidth,
//                  height: screenSize.height / 1.7,
//                  decoration: new BoxDecoration(
//                    color: new Color.fromRGBO(121, 114, 173, 1.0),
//                    borderRadius: new BorderRadius.circular(8.0),
//                  ),
//                  child: new Column(
//                    children: <Widget>[
//                      new Container(
//                        width: screenSize.width / 1.2 + cardWidth,
//                        height: screenSize.height / 2.2,
//                        child: Text(
//                            card.question,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 20.0,
//                            ),
//                        ),
//                        decoration: new BoxDecoration(
//                          borderRadius: new BorderRadius.only(
//                              topLeft: new Radius.circular(8.0),
//                              topRight: new Radius.circular(8.0)),
//                        ),
//                      ),
//                      new Container(
//                          width: screenSize.width / 1.2 + cardWidth,
//                          height: screenSize.height / 1.7 - screenSize.height / 2.2,
//                          alignment: Alignment.center,
//                          child: new Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              new FlatButton(
//                                  padding: new EdgeInsets.all(0.0),
//                                  onPressed: () {
//                                    swipeLeft();
//                                  },
//                                  child: new Container(
//                                    height: 60.0,
//                                    width: 130.0,
//                                    alignment: Alignment.center,
//                                    decoration: new BoxDecoration(
//                                      color: Colors.red,
//                                      borderRadius:
//                                      new BorderRadius.circular(60.0),
//                                    ),
//                                    child: new Text(
//                                      "DON'T",
//                                      style: new TextStyle(color: Colors.white),
//                                    ),
//                                  )),
//                              new FlatButton(
//                                  padding: new EdgeInsets.all(0.0),
//                                  onPressed: () {
//                                    swipeRight();
//                                  },
//                                  child: new Container(
//                                    height: 60.0,
//                                    width: 130.0,
//                                    alignment: Alignment.center,
//                                    decoration: new BoxDecoration(
//                                      color: Colors.cyan,
//                                      borderRadius:
//                                      new BorderRadius.circular(60.0),
//                                    ),
//                                    child: new Text(
//                                      "I'M IN",
//                                      style: new TextStyle(color: Colors.white),
//                                    ),
//                                  ))
//                            ],
//                          ))
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    ),
//  );
//}