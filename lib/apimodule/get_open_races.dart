import 'package:http/http.dart' as http;
import 'package:majidapp/chickenmodule/models/OpenRaceModel.dart';
import 'package:majidapp/commonmodule/demoAPIdata.dart';

class GetOpenRaces {
  static var client = http.Client();
  static Future<OpenRacesModel> fetchOpenRaces(int page, int limit) async {
    var response =
        await client.get(Uri.parse('https://api.chickenderby.com/api/races?page=$page&limit=$limit&filter={"status":"open"}'));
    if (response.statusCode == 200) {
      return openRacesFromJson(response.body);
    } else {
      return OpenRacesModel(count: -1, rows: []);
    }
  }

  static Future<OpenRacesModel> fetchOpenRacesdebug(int page, int limit) async {
    await Future.delayed(Duration(seconds: 2));
    return openRacesFromJson(DemoJsonData.openraces);
  }
}
