
import 'package:get/get.dart';
import 'package:majidapp/apimodule/get_race_info.dart';
import 'package:majidapp/chickenmodule/models/RaceDataModel.dart';

class RaceDataController extends GetxController{
  var model = RaceDataModel().obs;
  var isLoading = false.obs;
  var notFound = false.obs;
  var isError = false.obs;

  @override
  onInit() async {
    super.onInit();
  }


  Future<void> fetchRaceData(int raceId) async{
    try{
      isLoading.value = true;
      model.value = await GetChickenAPI.fetchRacedata(raceId);
      if (model.value.id==-1){
        isError.value = true;
      }
      else if (model.value.id==-2){
        notFound.value = true;
      }
    }
    finally{
      isLoading.value = false;
    }

  }

}