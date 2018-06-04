import 'Airport.dart' show Airport;
import 'Flight.dart' show Flight;
import 'DateTimeUtils.dart';

enum DutyNature {
  LEAVE,
  OFF,
  GROUND,
  SIMULATOR,
  FLIGHT,
}

/// Duty class
/// Representing a duty.
class Duty {

  DutyNature _nature;
  DateTime _startTime;
  DateTime _endTime;
  Airport _startPlace;
  Airport _endPlace;
  List<Flight> _flights;

  DutyNature get nature => _nature;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;
  Airport get startPlace => _startPlace;
  Airport get endPlace => _endPlace;
  Duration get duration {
    if (_endTime == null || _startTime == null) { return new Duration(); }
    return _endTime.difference(_startTime);
  }
  List<Flight> get flights => _flights;

  //TODO: Add convenient setters with other types if needed.
  set nature (DutyNature nature) => _nature = nature;
  set startTime (DateTime time) => _startTime = time;
  set endTime (DateTime time) => _endTime = time;
  set startPlace (Airport airport) => _startPlace = airport;
  set endPlace (Airport airport) => _endPlace = airport;

  addFlight(Flight flight) {
    _flights.add(flight);
  }

  toString() {

    String result = "|";

    switch (_nature) {
      case DutyNature.FLIGHT:
        result += "FLIGHT   |";
        break;
      case DutyNature.GROUND:
        result += "GROUND   |";
        break;
      case DutyNature.LEAVE:
        result += "LEAVE    |";
        break;
      case DutyNature.OFF:
        result += "OFF      |";
        break;
      case DutyNature.SIMULATOR:
        result += "SIMULATOR|";
        break;
      default:
        result += "UNKNOWN  |";
        break;
    }

    startPlace == null ? result += 'XXX|' : result += startPlace.IATA + '|';
    startTime == null ? result += 'DDMMMYYYY HH:MM|' : result += DateTimeToString(startTime) + '|';
    endPlace == null ? result += 'XXX|' : result += endPlace.IATA + '|';
    endTime == null ? result += 'DDMMMYYYY HH:MM|' : result += DateTimeToString(endTime) + '|';
    result += DurationToString(duration) + '|';

    return result;
  }
}