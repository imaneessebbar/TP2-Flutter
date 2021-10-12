import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Input(
    BuildContext context, String cityname, TextEditingController _getCity) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Positioned(
        width: (MediaQuery.of(context).size.width) / 4 * 2,
        top: 20,
        left: 10,
        child: TextField(
          autofocus: true,
          controller: _getCity,
          onEditingComplete: () => cityname = _getCity.text,
          decoration: InputDecoration(
            labelText: 'Ville',
          ),
        ),
      ),
    ],
  );
}
