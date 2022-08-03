
import 'package:get/get.dart';
import 'package:majidapp/apimodule/api_service.dart';
import 'package:majidapp/productmodule/models/RaceDataModel.dart';

class RaceDataController extends GetxController{
  var status = "STARTED".obs; // STARTED LOADING FOUND NOTFOUND ERROR
  var model = RaceDataModel().obs;

  @override
  onInit() async {
    super.onInit();
  }
  void sortRaces(){
    model.value.lanes = [for (var i=1;i<=12;i++) findPosition(i)];
  }
  
  findPosition(int pos){
    for(var elem in model.value.lanes!){
      if (elem.chicken?.position==pos){
        return elem;
      }
    }
  }


  Future<void> fetchRaceData(int raceId) async{
    try{
      status.value = "LOADING";
      model.value = await GetChickenAPI.fetchRacedata(raceId);
      if (model.value.id==-1){
        status.value = "ERROR";
      }
      else if (model.value.id==-2){
        status.value="NOTFOUND";
      }
      else{
        status.value= "FOUND";
      }
    }
    finally{
    }

  }

}