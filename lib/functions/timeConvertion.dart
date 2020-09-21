import 'package:flutter/material.dart';

double timeToDouble(TimeOfDay myTime) => myTime.hour + myTime.minute/60.0;
TimeOfDay timeFromDouble(double myTime) => TimeOfDay(hour: myTime.toInt(), minute: int.tryParse(myTime.toString().split('.')[1]) * 6);

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}