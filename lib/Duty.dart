import 'dart:convert' show json;

import 'Airport.dart' show Airport;
import 'Flight.dart' show Flight;
import 'DateTimeUtils.dart';

List<String> DutyNature = [
  'LEAVE',
  'OFF',
  'GROUND',
  'SIMULATOR',
  'FLIGHT',
];

/// Duty class
/// Representing a duty.
class Duty {

  String _nature;
  DateTime _startTime;
  DateTime _endTime;
  DateTime _startTimeLoc;
  DateTime _endTimeLoc;
  Airport _startPlace;
  Airport _endPlace;
  List<Flight> _flights;

  Duty();

  String get nature => _nature;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;
  DateTime get startTimeLoc => _startTimeLoc;
  DateTime get endTimeLoc => _endTimeLoc;
  Airport get startPlace => _startPlace;
  Airport get endPlace => _endPlace;
  Duration get duration {
    if (_endTime == null || _startTime == null) { return new Duration(); }
    return _endTime.difference(_startTime);
  }
  List<Flight> get flights => _flights;

  //TODO: Add convenient setters with other types if needed.
  set nature (String nature) {
    DutyNature.contains(nature) ? _nature = nature : _nature = "UNKNOWN";
  }
  set startTime (DateTime time) => _startTime = time;
  set endTime (DateTime time) => _endTime = time;
  set startTimeLoc (DateTime time) => _startTimeLoc = time;
  set endTimeLoc (DateTime time) => _endTimeLoc = time;
  set startPlace (Airport airport) => _startPlace = airport;
  set endPlace (Airport airport) => _endPlace = airport;

  addFlight(Flight flight) {
    _flights.add(flight);
  }

  toString() {

    String result = "|";

    nature == null ? result += 'UNKNOWN  |' : result += nature;
    startPlace == null ? result += 'XXX|' : result += startPlace.IATA + '|';
    startTime == null ? result += 'DDMMMYYYY HH:MM|' : result += DateTimeToString(startTime) + '|';
    endPlace == null ? result += 'XXX|' : result += endPlace.IATA + '|';
    endTime == null ? result += 'DDMMMYYYY HH:MM|' : result += DateTimeToString(endTime) + '|';
    result += DurationToString(duration) + '|';

    return result;
  }

  // JSON stuff
  Duty.fromJson(Map<String, String> jsonObject) {
    _nature = jsonObject['nature'];
    _startTime = StringToDateTime(jsonObject['startTime']);
    _endTime = StringToDateTime(jsonObject['endTime']);
    _startTimeLoc = StringToDateTime(jsonObject['startTimeLoc']);
    _endTimeLoc = StringToDateTime(jsonObject['endTimeLoc']);
    _startPlace = new Airport()
      ..IATA = jsonObject['startPlace'];
    _endPlace = new Airport()
      ..IATA = jsonObject['endPlace'];

    // TODO: Flights
  }

  Map<String, String> toJson() {
    Map<String, String> jsonDuty = {
      'nature': _nature,
      'startTime' : DateTimeToString(_startTime),
      'endTime': DateTimeToString(_endTime),
      'startTimeLoc': DateTimeToString(_startTimeLoc),
      'endTimeLoc': DateTimeToString(_endTimeLoc),
      'startPlace': _startPlace.IATA,
      'endPlace': _endPlace.IATA,
      // TODO: Flights
    };

    return jsonDuty;
  }
}