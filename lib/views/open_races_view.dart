import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/chickenmodule/controllers/open_race_con.dart';
import 'package:majidapp/chickenmodule/models/OpenRaceModel.dart';
import 'package:majidapp/commonviews/textWidget.dart';

class OpenRacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OpenRaceController controller = Get.find<OpenRaceController>();
    return Obx(() {
      if (controller.isLoading.value || controller.model.value.count == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.isError.value) {
        return Center(
          child: Text('Error'),
        );
      } else if (controller.notFound.value) {
        return Center(
          child: Text('Not Found'),
        );
      } else {
        if (kDebugMode) {}
        return ListView.separated(
            controller: controller.scrollcontroller,
            itemCount: controller.model.value.rows.length + (controller.isLoadingMore.value ? 1 : 0),
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                height: 1,
              );
            }, //RaceListView(controller.model.value.rows![index])
            itemBuilder: (context, index) {
              if (index < controller.model.value.rows.length) {
                return RaceListView(controller.model.value.rows[index], index);
              } else if (controller.isLoadingMore.value) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return Container();
              }
            }
            // return Center(child:Text('${controller.model.value.rows![index].terrainId}'));          },
            );
      }
    });
  }
}

class RaceListView extends StatelessWidget {
  final Rows race;
  final int index;
  const RaceListView(
    this.race,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/terrain/terrain_${race.terrainId}.png",
                        width: 30,
                        height: 30,
                      )),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                    // height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AdvancedText("${race.name}", 14, FontWeight.w500),
                            AdvancedText("${race.peckingOrder}", 12, FontWeight.w500)
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AdvancedText("\$${race.feeUSD}"),
                                const SizedBox(
                                  width: 3,
                                ),
                                Container(
                                  height: 11,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.25),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                AdvancedText("\$${race.prizePoolUSD}"),
                              ],
                            ),
                            AdvancedText("${race.distance}m"),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [AdvancedText("${race.currentCapacity}/${race.maxCapacity}"), AdvancedText("$index")],
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
