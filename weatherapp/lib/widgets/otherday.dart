import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/models/weathermodels.dart';

Widget OtherDay(BuildContext context, String day, String max, String min,
    String description, int index) {
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width) / 13,
        ),
        Container(
          width: (MediaQuery.of(context).size.width) / 4,
          child: Text(
            day,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) / 4,
          child: ImageOther(context, description, index),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) / 4,
          child: Text(
            "$min / $max °C",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

Widget ImageOther(BuildContext context, String description, int index) {
  if (description == 'Clouds' ||
      description == 'Clear' ||
      description == 'Rain' ||
      description == 'Wind' ||
      description == 'Sun' ||
      description == "Snow") {
    {
      return Container(
          child: Image.asset(
        "assets/images/${description.toLowerCase()}.png",
        height: 50,
        width: 50,
      ));
    }
  } else {
    {
      return Text("");
    }
  }
}
