import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime {
  String location; //location name for UI
  String time = ""; //the time in that location
  String flag; //url to asset flag icon
  String url; //location url for api endpoint
  bool? isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    int maxRetries = 3;
    for(int i = 0 ; i< maxRetries ; i++){
      try {
        Response response = await get(
            Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);
        String datetime = data["utc_datetime"];
        String offset = data["utc_offset"].substring(1, 3);
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        isDayTime = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
        print(time);
        break;
      } catch (e) {
        print('Error: $e');
        time = "Error";
        await Future.delayed(Duration(seconds: 2)); // Example delay
      }
    }
    // try {
    //   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    //   Map data = jsonDecode(response.body);
    //   String datetime = data["utc_datetime"];
    //   String offset = data["utc_offset"].substring(1,3);
    //   DateTime now = DateTime.parse(datetime);
    //   now = now.add(Duration(hours: int.parse(offset)));
    //   isDayTime = now.hour > 6 && now.hour < 20;
    //   time = DateFormat.jm().format(now);
    //   print(time);
    // }
    // catch(e){
    //   print('Error: $e');
    //   time = "could not get time data";
    // }


    // const int maxRetries =3;
    // int retryCount = 0 ;
    //
    // while (retryCount < maxRetries) {
    //   try {
    //     Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    //
    //     if (response.statusCode == 200) {
    //       Map data = jsonDecode(response.body);
    //       String datetime = data["utc_datetime"];
    //       String offset = data["utc_offset"].substring(1,3);
    //       DateTime now = DateTime.parse(datetime);
    //       now = now.add(Duration(hours: int.parse(offset)));
    //       time = now.toString();
    //       break; // Success, exit the loop
    //     } else {
    //       print('Request failed with status: ${response.statusCode}');
    //     }
    //   } catch (e) {
    //     print('Error: $e');
    //   }
    //
    //   retryCount++;
    // }

    // Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    // Map data = jsonDecode(response.body);
    // String datetime = data["utc_datetime"];
    // String offset = data["utc_offset"].substring(1,3);
    // DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    // time = now.toString();


    // try {
    //   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    //   if (response.statusCode == 200) {
    //     Map data = jsonDecode(response.body);
    //     String datetime = data["utc_datetime"];
    //     String offset = data["utc_offset"].substring(1,3);
    //     //print(datetime);
    //     //print(offset);
    //     DateTime now = DateTime.parse(datetime);
    //     now = now.add(Duration(hours: int.parse(offset)));
    //     time = now.toString();
    //   } else {
    //     print('Request failed with status: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error: $e');
    // }
  }

}