import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CityDate(BuildContext context, String cityName, String now) {
  {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          width: (MediaQuery.of(context).size.width) / 5 * 3,
          top: 10,
          child: Text(
            "$cityName ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
        Positioned(
          width: (MediaQuery.of(context).size.width) / 5 * 3,
          top: 40,
          child: Text(
            now,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
