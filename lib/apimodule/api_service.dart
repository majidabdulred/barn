import 'package:http/http.dart' as http;
import 'package:majidapp/commonmodule/demoAPIdata.dart';
import 'package:majidapp/productmodule/models/RaceDataModel.dart';

class GetChickenAPI{
  static var client=http.Client();
  static Future<RaceDataModel> fetchRacedata(int raceId) async{
    var response = await client.get(Uri.parse("https://api.chickenderby.com/api/races/$raceId"));
    if (response.statusCode==200){
      return raceModelFromJson(response.body);
    }
    else if(response.statusCode==400){
      return RaceDataModel(id:-2);
    }
    else{
      return RaceDataModel(id: -1);
    }
  }
  static Future<RaceDataModel> fetchRacedatafake(int raceId) async{
    // await Future.delayed(Duration(seconds: 2));
    return raceModelFromJson(DemoJsonData.racedata);
  }

}