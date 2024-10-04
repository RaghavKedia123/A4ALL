import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate {
    return '$day/$month/$year';
  }
}

extension DateTimeExtension2 on TimeOfDay {
  String formatToAmPm() {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    return DateFormat.jm().format(dateTime);
  }
}
