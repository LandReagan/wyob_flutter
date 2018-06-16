import 'dart:io';

import 'Flight.dart' show Flight;
import 'Duty.dart' show Duty;
import 'Parsers.dart' show parseCheckinList;

/// Creates duties and flights objects out of 'checkin' list string
class IobDutyFactory {

  static List<Duty> run(String checkinTxt) {

    List<Duty> duties = [];

    List<Map<String, String>> iobMaps = parseCheckinList(checkinTxt);

    for (Map<String, String> iobMap in iobMaps) {

      if (iobMap['Trip'] != '' || iobMap['Duty'] != '') {
        // It is a Duty
        Duty duty = new Duty.fromIobMap(iobMap);
        duties.add(duty);
      } else if (iobMap['Flight'] != '') {
        // It is a Flight
        Flight flight = new Flight.fromIobMap(iobMap);
        duties.last.addFlight(flight);
      }
    }

    return duties;
  }
}


void main() {

  File inFile = new File("test/HTML files/checkinlist.htm");
  String testCheckinString = inFile.readAsStringSync();
  var duties = IobDutyFactory.run(testCheckinString);
  for (var duty in duties) {
    print(duty);
  }
}