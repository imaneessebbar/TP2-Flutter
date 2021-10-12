import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'citydate.dart';
import 'teptoday.dart';

Widget Today(
    BuildContext context,
    String cityName,
    String now,
    String weatherdescription,
    String temp,
    String feels,
    String humidity,
    String min,
    String max) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 200,
        width: (MediaQuery.of(context).size.width) / 5 * 3,
        height: (MediaQuery.of(context).size.width) / 5 * 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: (MediaQuery.of(context).size.width) / 5 * 3,
                  height: (MediaQuery.of(context).size.width) / 5 * 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Rectangle 4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: CityDate(context, cityName.toUpperCase(), now),
            ),
            Positioned(child: TempToday(context, temp, weatherdescription)),
            Positioned(
              child: Container(
                child: Divider(
                  color: Colors.white,
                  height: (MediaQuery.of(context).size.width) / 7,
                  thickness: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
