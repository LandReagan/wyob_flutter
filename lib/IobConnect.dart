import 'dart:io';
import 'package:http/http.dart' as http;


/// URLs
String landingUrl = 'https://fltops.omanair.com/mlt/filter.jsp?window=filter&loggedin=false';
String loginFormUrl = 'https://fltops.omanair.com/mlt/loginpostaction.do';
String checkinListUrl = 'https://fltops.omanair.com/mlt/checkinlist.jsp';


class IobConnect {
  
  static void run(String username, String password) {
    var file = new File("chekin.txt");
    print('Running IobConnect...');
    http.Client client = new http.Client();
    client.get(
        'https://fltops.omanair.com/mlt/filter.jsp?window=filter&loggedin=false'
    ).then((response) {
      var tokenRegExp = new RegExp(
          r'<input type="hidden" name="token" value="(\S+)">'
      );
      var matchToken = tokenRegExp.firstMatch(response.body);
      print("Token: " + matchToken.group(1));
      return matchToken.group(1);
    }).then((token) {
      print("Connecting...");
      client.post(
        'https://fltops.omanair.com/mlt/loginpostaction.do',
        body: {"username": username, "password": password, "token": token}
      ).then((response) {
        var cookieRegExp = new RegExp(r'(JSESSIONID=\w+);');
        String cookie = cookieRegExp.firstMatch(response.headers.toString()).group(1);
        print("Cookie: $cookie");
        return cookie;
      }).then((cookie) {
        client.get('https://fltops.omanair.com/mlt/checkinlist.jsp', headers: {"Cookie": cookie}).then((response) {
          print(response.headers);
          print(response.body);
          file.writeAsStringSync(response.body);
          client.close();
        });
      });
    });
  }
}

void main() {
  IobConnect.run('93429', '93429');
}