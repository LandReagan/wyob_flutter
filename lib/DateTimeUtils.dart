List<String> months = [
  "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
  "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];

/// This function returns a properly formatted DateTime.
/// Format: DDMMMYYYY HH:MM
/// with month as the standard 3 letters (e.g. JAN, FEB, MAR, etc.).
String DateTimeToString(DateTime datetime) {

  String day = datetime.day.toString();
  if (day.length < 2) { day = "0" + day; }
  String month = months[datetime.month - 1];
  String year = datetime.year.toString();
  String hour = datetime.hour.toString();
  if (hour.length < 2) { hour = "0" + hour; }
  String minute = datetime.minute.toString();
  if (minute.length < 2) { minute = "0" + minute; }

  return day + month + year + " " + hour + ":" + minute;
}

/// This function returns a DateTime object out of a String.
/// Format: DDMMMYYYY HH:MM
/// with month as the standard 3 letters (e.g. JAN, FEB, MAR, etc.).
DateTime StringToDateTime(String txt) {

  RegExp regexp = new RegExp(
    r'(\d{2})(\w{3})(\d{4})\s(\d{2}):(\d{2})'
  );

  var match = regexp.firstMatch(txt);

  int day = int.parse(match.group(1));
  String monthString = match.group(2);
  int month = months.indexOf(monthString) + 1;
  int year = int.parse(match.group(3));
  int hour = int.parse(match.group(4));
  int minute = int.parse(match.group(5));

  return new DateTime(year, month, day, hour, minute);
}

String DurationToString(Duration duration) {

  String hours = duration.inHours.toString();
  String minutes = (duration.inMinutes ~/ 60).toString();
  hours.length < 2 ? hours = "0" + hours : null;
  minutes.length < 2 ? minutes = "0" + minutes : null;

  return hours + ":" + minutes;
}