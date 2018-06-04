import 'dart:io';

List<Map<String, String>> parseCheckinList(String txt) {

  List<Map<String, String>> checkinList;

  RegExp header = new RegExp(
  r'<th>(\S*)</th>'
  );
  var matches = header.allMatches(txt);
  
  for (var match in matches) {
    print("m: " + match.group(1));
  }
  
  return checkinList;
}

void main() {

  new File('chekin.txt').readAsString().then((content) {
    parseCheckinList(content);
  });

}