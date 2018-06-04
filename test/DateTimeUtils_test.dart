import "package:test/test.dart";
import "../lib/DateTimeUtils.dart";

void main() {

  group("DateTimeToString function test", () {
    test("Basic", () {
      DateTime datetime = new DateTime(1978, 11, 15, 3, 40);
      String result = DateTimeToString(datetime);
      expect(result, equals("15NOV1978 03:40"));
    });

    test("With all leading zeros", () {
      DateTime datetime = new DateTime(1978, 1, 3, 3, 6);
      String result = DateTimeToString(datetime);
      expect(result, equals("03JAN1978 03:06"));
    });
  });

  group("StringToDateTime function test", () {
    test("Basic", () {
      String txt = "15NOV1978 03:40";
      DateTime datetime = new DateTime(1978, 11, 15, 3, 40);
      expect(StringToDateTime(txt), equals(datetime));
    });
  });
}