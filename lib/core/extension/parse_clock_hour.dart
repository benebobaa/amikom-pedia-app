
extension ParseClockHour on String {
  String get clockHour {
    try {
      final DateTime dateTime = DateTime.parse(this);
      if (dateTime.hour < 11) {
        return '${dateTime.hour}Am';
      }
      if (dateTime.hour == 12) {
        return '${dateTime.hour}Pm';
      }
      if (dateTime.hour > 12) {
        return '${dateTime.hour - 12}Pm';
      }
      return '${dateTime.hour}';
    } catch (e) {
      return 'error'; // Return a default value or handle the error accordingly
    }
  }
}