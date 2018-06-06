import 'dart:io';
import 'package:http/http.dart' as http;


/// URLs
String landingUrl = 'https://fltops.omanair.com/mlt/filter.jsp?window=filter&loggedin=false';
String loginFormUrl = 'https://fltops.omanair.com/mlt/loginpostaction.do';
String checkinListUrl = 'https://fltops.omanair.com/mlt/checkinlist.jsp';


class IobConnect {
  
  static String run(String username, String password) {
    var file = new File("chekin.txt");
    http.Client client = new http.Client();
    client.get(
        'https://fltops.omanair.com/mlt/filter.jsp?window=filter&loggedin=false'
    ).then((response) {
      var tokenRegExp = new RegExp(
          r'<input type="hidden" name="token" value="(\S+)">'
      );
      var matchToken = tokenRegExp.firstMatch(response.body);
      return matchToken.group(1);
    }).then((token) {
      client.post(
        'https://fltops.omanair.com/mlt/loginpostaction.do',
        body: {"username": username, "password": password, "token": token}
      ).then((response) {
        var cookieRegExp = new RegExp(r'(JSESSIONID=\w+);');
        String cookie = cookieRegExp.firstMatch(response.headers.toString()).group(1);
        return cookie;
      }).then((cookie) {
        client.get('https://fltops.omanair.com/mlt/checkinlist.jsp', headers: {"Cookie": cookie}).then((response) {
          file.writeAsStringSync(response.body);
          client.close();
          return response.body;
        });
      });
    });
  }
}

void main() {
  IobConnect.run('93429', '93429');
}