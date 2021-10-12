import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getdescriptionIcon({required String description}) {
  if (description == 'Clouds' ||
      description == 'Clear' ||
      description == 'Rain' ||
      description == 'Wind' ||
      description == 'Sun' ||
      description == "Snow") {
    {
      return Image.asset(
        "assets/images/${description.toLowerCase()}.png",
        height: 150,
        width: 150,
        //fit: BoxFit.fitWidth,
      ); //Icon(FontAwesomeIcons.cloud);
    }
  } else {
    {
      return Text(""); //Icon(FontAwesomeIcons.sun);
    }
  }
}
