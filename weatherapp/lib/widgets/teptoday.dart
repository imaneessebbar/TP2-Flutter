import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'getWeatherIcon.dart';

Widget TempToday(BuildContext context, String _temp, String weather) {
  {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 45,
          right: (MediaQuery.of(context).size.width) / 4,
          child: Container(child: getdescriptionIcon(description: weather)),
        ),
        Positioned(
            width: (MediaQuery.of(context).size.width) / 5 * 3,
            top: 100,
            left: (MediaQuery.of(context).size.width) / 6 * 2,
            child: Container(
              child: Text(
                "$_temp ",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ))
      ],
    );
  }
}
