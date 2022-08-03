import 'package:get/get.dart';
import 'package:majidapp/apimodule/races_by_chicken.dart';
import 'package:majidapp/chickenmodule/models/RacesByChickenModel.dart';

class RacesByChickenController extends GetxController{
  var isLoading=false.obs;
  var races = RacesByChickenModel().obs;
  var isError = false.obs;


  @override
  onInit() async {
    super.onInit();
  }


  Future<void> fetchRacesByChicken(int chickenId)async{
    try{
      isLoading.value = true;
      races.value = await GetRacesByChickenApi.fetchRacesByChicken(chickenId);
      if (races.value.count!>0){

      }
      else if (races.value.count==-1){
        isError.value=true;
      }
      }
      finally{
      isLoading.value = false;
      }
    }
  }


