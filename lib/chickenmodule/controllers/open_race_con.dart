import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/apimodule/get_open_races.dart';
import 'package:majidapp/chickenmodule/models/OpenRaceModel.dart';

class OpenRaceController extends GetxController {
  var isLoading = false.obs;
  var isError = false.obs;
  var notFound = false.obs;
  var model = OpenRacesModel(rows: []).obs;
  var scrollcontroller = ScrollController();
  var isLoadingMore = false.obs;
  var page;
  OpenRaceController() {
    this.page = 0;
  }

  @override
  onInit() async {
    isLoading.value = true;
    fetchOpenRaceData(1, 10);
    super.onInit();
    scrollcontroller.addListener(() async {
      print(
          "page: ${this.page} ${scrollcontroller.position.pixels.toInt()} ${scrollcontroller.position.maxScrollExtent.toInt()}");

      if ((scrollcontroller.position.pixels * 100 / scrollcontroller.position.maxScrollExtent) >= 100 && !isLoadingMore.value) {
        print("Loading Page ${this.page}");
        isLoadingMore.value = true;
        await fetchOpenRaceData(this.page + 1, 3);
      }
    });
  }

  Future<void> fetchOpenRaceData(int page, int items) async {
    try {
      var response = await GetOpenRaces.fetchOpenRaces(page, items);
      if (response.count == 0) {
        notFound.value = true;
      } else if (response.count == -1) {
        isError.value = true;
      } else {
        model.value.rows.addAll(response.rows);
        model.value.count = response.count;
        this.page++;

        print("Loaded Page : ${this.page} : Aded Rows : ${response.rows.length} : Total Rows : ${model.value.rows.length}");
      }
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
      if (kDebugMode) {
        print("Loading Done");
      }
    }
  }
}
