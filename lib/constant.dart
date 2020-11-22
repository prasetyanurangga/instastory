import 'package:flutter/material.dart';

const kTextCardColor = Color(0xFF7c7c7c);
const kTextColor = Color(0xFFFFFFFF);
const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);
const kDefaultPaddin = 20.0;

List<List<Color>> backColor = [
  [
    Color(0xFF6BB8E7),
    Color(0xFF555EDD),
  ],
  [
    Color(0xFFF0B353),
    Color(0xFFE94276),
  ],
  [
    Color(0xFF38ef7d),
    Color(0xFF11998e),
  ],
];

List<Icon> icons = [
  Icon(
    Icons.person,
    color: backColor[0][1],
  ),
  Icon(
    Icons.mail,
    color: backColor[1][1],
  ),
  Icon(
    Icons.home,
    color: backColor[2][1],
  ),
];
