import 'package:test/test.dart';
import '../lib/Duty.dart' show DutyNature, Duty;


void main() {

  test("Nature getter unit test", () {
    var duty = new Duty();
    duty.nature = DutyNature.FLIGHT;
    expect(duty.nature, equals(DutyNature.FLIGHT));
  });

  group("DateTime and Duration tests", () {
    test("Duty duration", () {
      var duty = new Duty();
      DateTime start = new DateTime(1978, 11, 15, 4, 20);
      DateTime end = new DateTime(1978, 11, 15, 5, 34);
      Duration duration = end.difference(start);
      duty.startTime = start;
      duty.endTime = end;
      expect(duty.duration, equals(duration));
    });

    test("Empty Duty toString()", () {
      var duty = new Duty();
      expect(duty.toString(), '|UNKNOWN  |XXX|DDMMMYYYY HH:MM|XXX|DDMMMYYYY HH:MM|00:00|');
    });
  });
}