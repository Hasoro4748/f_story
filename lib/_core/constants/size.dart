import 'package:flutter/material.dart';

const double smallGap = 5.0;
const double mediumGap = 10.0;
const double largeGap = 20.0;
const double xlargeGap = 100.0;

// 현재 모바일의 가로, 세로 크기를 동적으로 가져올때
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
