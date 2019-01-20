import 'package:flutter/material.dart';
import '../model/card.dart';

Positioned backgroundCard(
    QuizCard card,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return new Positioned(
    bottom: 100.0 + bottom,
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
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(8.0),
                  topRight: new Radius.circular(8.0)
                ),
              ),
            ),
            new Container(
                width: screenSize.width / 1.2 + cardWidth,
                height: screenSize.height / 1.7 - screenSize.height / 2.2,
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FlatButton(
                        padding: new EdgeInsets.all(0.0),
                        onPressed: () {},
                        child: new Container(
                          height: 60.0,
                          width: 130.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: new BorderRadius.circular(60.0),
                          ),
                          child: new Text(
                            "DON'T",
                            style: new TextStyle(color: Colors.white),
                          ),
                        )),
                    new FlatButton(
                        padding: new EdgeInsets.all(0.0),
                        onPressed: () {},
                        child: new Container(
                          height: 60.0,
                          width: 130.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: new BorderRadius.circular(60.0),
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
  );
}