import 'package:flutter/material.dart';

Color defautlColor =const Color(0xFFE62626);
Color backgroundColor =const Color.fromARGB(255, 250, 250, 250);
Color defautlColor2 = Color.fromARGB(255, 251, 251, 251);
const Shadow shadow =
    Shadow(offset: Offset(0.5, 0.5), color: Color.fromARGB(255, 252, 11, 11), blurRadius: 1);
    const Shadow shadowWhite =
    Shadow(offset: Offset(0.4, 1), color: Colors.white, blurRadius: 1);

const Shadow whiteShadow =
    Shadow(offset: Offset(0.5, 0.5), color: Color.fromARGB(255, 252, 251, 249), blurRadius: 1);

TextStyle? defaultStyle (context)=>Theme.of(context).textTheme.bodyText1;
// height of ful screen
height(context) => MediaQuery.of(context).size.height;

// width of ful screen
width(context) => MediaQuery.of(context).size.width;
