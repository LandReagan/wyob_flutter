import 'package:test/test.dart';

import 'package:wyob/Flight.dart' show Flight;

void main() {

  group("Iob stuff", () {

    test("fromIobMap constructor", () {

      Map<String, String> iobMap = {
        'Flight': 'WY123',
        'Start': '15Nov1978 03:40 (02:40)',
        'End': '15Nov1978 07:55 (07:55)',
        'From': 'MRS',
        'To': 'LHR'
      };

      Flight flight = new Flight.fromIobMap(iobMap);

      expect(flight.flightNumber, equals('WY123'));
      expect(flight.startPlace.IATA, equals('MRS'));
      expect(flight.endPlace.IATA, equals('LHR'));
      expect(flight.startTime.toString(), equals("15Nov1978 03:40 +01:00"));
      expect(flight.endTime.toString(), equals("15Nov1978 07:55 +00:00"));
    });
  });
}