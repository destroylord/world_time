import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:http/retry.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    final client = RetryClient(http.Client());

    // make the request
    try {
      final response = await client
          .read(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = convert.jsonDecode(response);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time properties
      time = now.toString();
    } finally {
      client.close();
    }
  }
}
