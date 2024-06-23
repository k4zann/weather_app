import 'package:intl/intl.dart';

String dateFormat(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}

String timeFormat(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final String formattedTime = DateFormat.Hm().format(dateTime); // Use 'Hm' for 24-hour format or 'jm' for 12-hour format
  return formattedTime;
}