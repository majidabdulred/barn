import 'package:http/http.dart' as http;
import 'package:majidapp/commonmodule/demoAPIdata.dart';
import 'package:majidapp/productmodule/models/RaceDataModel.dart';
import 'package:majidapp/productmodule/models/product_model.dart';

class ApiService{
  static var client = http.Client();
  
  static Future<List<ProductModel>> fetchProduct() async{
    var response = await client.get(Uri.parse("http://makeup-api.herokuapp.com/api/v1/products.json?brand=milani"));
    if (response.statusCode == 200){
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    else{
      return [];
    }
  }
}

class GetChickenAPI{
  static var client=http.Client();
  static Future<RaceDataModel> fetchRacedatareal(int raceId) async{
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
  static Future<RaceDataModel> fetchRacedata(int raceId) async{
    // await Future.delayed(Duration(seconds: 2));
    return raceModelFromJson(DemoJsonData.racedata);
  }

}