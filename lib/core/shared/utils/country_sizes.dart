import 'package:flutter/material.dart';

double cWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width;
}

double cHeight(BuildContext context, double height) {
  return MediaQuery.of(context).size.height * height;
}

double kbHeight(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}
