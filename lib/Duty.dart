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
  AwareDT _startTime;
  AwareDT _endTime;
  Airport _startPlace;
  Airport _endPlace;
  List<Flight> _flights;

  Duty();

  String get nature => _nature;
  AwareDT get startTime => _startTime;
  AwareDT get endTime => _endTime;
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
  set startTime (AwareDT time) => _startTime = time;
  set endTime (AwareDT time) => _endTime = time;
  set startPlace (Airport airport) => _startPlace = airport;
  set endPlace (Airport airport) => _endPlace = airport;

  addFlight(Flight flight) {
    _flights.add(flight);
  }

  toString() {

    String result = "|";

    nature == null ? result += 'UNKNOWN  |' : result += nature;
    startPlace == null ? result += 'XXX|' : result += startPlace.IATA + '|';
    startTime == null ?
      result += 'DDMMMYYYY HH:MM|' : result += startTime.toString() + '|';
    endPlace == null ? result += 'XXX|' : result += endPlace.IATA + '|';
    endTime == null ?
      result += 'DDMMMYYYY HH:MM|' : result += endTime.toString() + '|';
    result += DurationToString(duration) + '|';

    return result;
  }

  // JSON stuff
  Duty.fromJson(Map<String, String> jsonObject) {
    _nature = jsonObject['nature'];
    _startTime = new AwareDT.fromIobString(jsonObject['startTime']);
    _endTime = new AwareDT.fromIobString(jsonObject['endTime']);
    _startPlace = new Airport.fromIata(jsonObject['startPlace']);
    _endPlace = new Airport.fromIata(jsonObject['endPlace']);

    // TODO: Flights
  }

  Map<String, String> toJson() {
    Map<String, String> jsonDuty = {
      'nature': _nature,
      'startTime' : _startTime.toString(),
      'endTime': _endTime.toString(),
      'startPlace': _startPlace.IATA,
      'endPlace': _endPlace.IATA,
      // TODO: Flights
    };

    return jsonDuty;
  }
}