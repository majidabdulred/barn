import 'package:http/http.dart' as http;
import 'package:majidapp/commonmodule/demoAPIdata.dart';
import 'package:majidapp/chickenmodule/models/RacesByChickenModel.dart';

class GetRacesByChickenApi{
  static var client=http.Client();
  static Future<RacesByChickenModel> fetchRacesByChicken(int chickenId) async{
    var response = await client.get(Uri.parse("https://api.chickenderby.com/api/races/chickens/$chickenId"));
    if (response.statusCode==200){
      return racesbyChickenModelFromJson(response.body,chickenId);
    }
    else{
      return RacesByChickenModel(count: -1);
    }
  }
  static Future<RacesByChickenModel> fetchRacesByChickenDebug(int chickenId) async{
    await Future.delayed(Duration(seconds: 2));
    return racesbyChickenModelFromJson(DemoJsonData.racesbychicken,12286);
  }

}