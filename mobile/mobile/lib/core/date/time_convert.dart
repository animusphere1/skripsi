import 'package:flutter/material.dart';

String convertTo24Hour(TimeOfDay waktu) {
  var replacingTime = waktu.replacing(hour: waktu.hour, minute: waktu.minute);

  String formattedTime =
      replacingTime.hour.toString() + ":" + replacingTime.minute.toString();

  return formattedTime;
}
