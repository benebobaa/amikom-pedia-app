import 'package:intl/intl.dart';

extension ParseDateToDayName on String {
  String get dayName {
    try {
      final DateTime dateTime = DateTime.parse(this);
      final String formattedDay = DateFormat('EEE').format(dateTime);
      return formattedDay;
    } catch (e) {
      return 'Error'; // Return a default value or handle the error accordingly
    }
  }
}