import 'dart:io' show File;
import 'dart:convert' show json;

import 'package:test/test.dart';
import '../lib/Duty.dart';
import '../lib/Parsers.dart' show parseCheckinList;


void main() {

  test("Nature getter unit test", () {
    var duty = new Duty();
    duty.nature = "FLIGHT";
    expect(duty.nature, equals("FLIGHT"));
  });

  group("DateTime and Duration tests", () {

    test("Empty Duty toString()", () {
      var duty = new Duty();
      expect(duty.toString(), '|UNKNOWN  |UNKNOWN  |XXX|DDMMMYYYY HH:MM|XXX|DDMMMYYYY HH:MM|+00:00|');
    });
  });

  group("JSON stuff", () {
    test("Duty.fromJson constructor", (){

    });
  });
}