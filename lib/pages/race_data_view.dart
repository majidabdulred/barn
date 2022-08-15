import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:majidapp/commonmodule/AppColor.dart';
import 'package:majidapp/commonviews/skeletonClass.dart';
import 'package:majidapp/commonviews/textWidget.dart';
import 'package:majidapp/pages/SIngleChickenView.dart';
import 'package:majidapp/chickenmodule/controllers/raceData_controller.dart';

class RaceDataView extends StatelessWidget {
  const RaceDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String raceId = Get.arguments;
    RaceDataController raceData = Get.put(RaceDataController(), tag: raceId);
    raceData.fetchRaceData(int.parse(raceId));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Race Details"),
        ),
        backgroundColor: AppColor.color1,
        body: Obx(() {
          if (raceData.isLoading.value || raceData.model.value.id == null) {
            return ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const ShaderRaces();
                });
          } else if (raceData.notFound.value) {
            return Center(
              child: AdvancedText(
                  "Race Not Found", 25, FontWeight.bold, Colors.black),
            );
          } else if (raceData.isError.value) {
            return Center(
              child: AdvancedText(
                  "Race Not Found", 25, FontWeight.bold, Colors.black),
            );
          } else {
            return ListView.builder(
                itemCount: raceData.model.value.lanes?.length,
                itemBuilder: (context, index) {
                  var chicken = raceData.model.value.lanes![index].chicken!;
                  return GestureDetector(
                    onTap: () {
                      Get.to(const SingleChickenTabView(), arguments: chicken);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Hero(
                                tag: "${chicken.id}",
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: "${chicken.image}",
                                      placeholder: (context, url) =>
                                          const Skeleton(
                                        height: 150,
                                        width: 100,
                                      ),
                                      errorWidget: (ctx, url, error) =>
                                          const Icon(Icons.error),
                                    )),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AdvancedText(
                                          "${chicken.name ?? chicken.id}",
                                          16,
                                          FontWeight.w500),
                                      AdvancedText(
                                          "${chicken.id}", 12, FontWeight.w500)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AdvancedText("${chicken.owner}"),
                                      AdvancedText(
                                          "${chicken.cumulativeSegmentSize?.toStringAsFixed(2)}s",
                                          12)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AdvancedText("${chicken.heritage}"),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      AdvancedText("${chicken.perfection}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AdvancedText("${chicken.firsts}"),
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
                                      AdvancedText("${chicken.seconds}"),
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
                                      AdvancedText("${chicken.thirds}")
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                });
          }
        }));
  }
}

class ShaderRaces extends StatelessWidget {
  const ShaderRaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 100,
              margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: const Skeleton(
                height: 100,
                width: 100,
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Skeleton(
                        height: 13,
                        width: 150,
                      ),
                      Skeleton(
                        height: 13,
                        width: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Skeleton(
                        height: 15,
                        width: 120,
                      ),
                      Skeleton(
                        height: 13,
                        width: 45,
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Skeleton(
                        height: 13,
                        width: 60,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Skeleton(
                        height: 13,
                        width: 30,
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Skeleton(
                        height: 13,
                        width: 50,
                      ),
                    ],
                  )
                ],
              ),
            ))
          ],
        )
      ],
    );
  }
}
