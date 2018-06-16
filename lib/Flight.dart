import 'Airport.dart' show Airport;
import 'DateTimeUtils.dart' show AwareDT, DurationToString;

/// This class represents a flight
class Flight {

  AwareDT startTime;
  AwareDT endTime;
  Airport startPlace;
  Airport endPlace;
  String flightNumber;

  Duration get duration => endTime.difference(startTime);

  Flight.fromJson(Map<String, String> jsonObject) {
    startTime = new AwareDT.fromString(jsonObject['startTime']);
    endTime = new AwareDT.fromString(jsonObject['endTime']);
    startPlace = new Airport.fromIata(jsonObject['startPlace']);
    endPlace = new Airport.fromIata(jsonObject['endPlace']);
    flightNumber = jsonObject['flightNumber'];
  }

  Flight.fromIobMap(Map<String, String> iobMap) {
    startTime = new AwareDT.fromIobString(iobMap['Start']);
    endTime = new AwareDT.fromIobString(iobMap['End']);
    startPlace = new Airport.fromIata(iobMap['From']);
    endPlace = new Airport.fromIata(iobMap['To']);
    flightNumber = iobMap['Flight'];
  }

  Map<String, String> toJson() {
    Map<String, String> jsonFlight = {
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
      'startPlace': startPlace.IATA,
      'endPlace': endPlace.IATA,
      'flightNumber': flightNumber,
    };
    return jsonFlight;
  }

  String toString() {

    String result = "|";

    flightNumber == null ? result += 'UNKNOWN  |' : result += flightNumber + '|';
    startPlace == null ? result += 'XXX|' : result += startPlace.IATA + '|';
    startTime == null ?
    result += 'DDMMMYYYY HH:MM|' : result += startTime.toString() + '|';
    endPlace == null ? result += 'XXX|' : result += endPlace.IATA + '|';
    endTime == null ?
    result += 'DDMMMYYYY HH:MM|' : result += endTime.toString() + '|';
    result += DurationToString(duration) + '|';

    return result;
  }
}