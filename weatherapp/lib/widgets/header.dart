import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Header(BuildContext context) {
  Color? blanc = Colors.blue[700];
  return Positioned(
    width: (MediaQuery.of(context).size.width),
    top: 0,
    //alignment: Alignment.center,
    child: SizedBox(
      width: (MediaQuery.of(context).size.width),
      height: 110,
      child: DecoratedBox(
        decoration: BoxDecoration(color: blanc),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 70, 0, 0),
          child: Text(
            "Weather",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
