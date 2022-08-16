import 'package:get/get.dart';

import '../chickenmodule/controllers/open_race_con.dart';

class InitalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpenRaceController>(() => OpenRaceController());
  }
}
