import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/chickenmodule/controllers/races_by_chicken_controller.dart';
import 'package:majidapp/commonviews/skeletonClass.dart';
import 'package:majidapp/commonviews/textWidget.dart';
import 'package:majidapp/pages/race_data_view.dart';
class RacesTabView extends StatelessWidget {
  int? tag;
  RacesTabView(this.tag,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RacesByChickenController racesC = Get.put(RacesByChickenController(),tag: "$tag");
    racesC.fetchRacesByChicken(tag!);
    return Obx(() {
      if (racesC.isLoading.value || racesC.races.value.count==null){
        return ListView.separated(
            separatorBuilder: (context,index){
              return Container(
                height: 2,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(175)
                ),
              );
            },
            itemCount: 20,
            itemBuilder: (context,index){
              return const ShaderElement();

            });
      }
      else if (racesC.races.value.count!>0){
        return ListView.separated(
              separatorBuilder: (context,index){
                return Container(
                  height: 2,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(175)
                  ),
                );
              },
              itemCount: racesC.races.value.rows!.length,
              itemBuilder: (context,index){
                var race = racesC.races.value.rows![index];
                return GestureDetector(
                  onTap: (){
                      Get.to(RaceDataView(),arguments: "${race.id}");
                  },
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
                                  child: Image.asset("assets/terrain/terrain_${race.terrainId}.png",
                                  width: 50,
                                  height: 50,)
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child:
                            Container(
                            padding: const EdgeInsets.fromLTRB(0,5,16,5),
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AdvancedText("${race.name}",16,FontWeight.w500),
                                    AdvancedText("${race.position}${posSuffix(race.position)}",12,FontWeight.w500)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AdvancedText("${race.distance}m"),
                                    TotalEarnings(race.totalearnings)
                                  ],
                                ),
                                Row(
                                  children: [
                                    AdvancedText(formatDate("${race.startsAt}")),
                                    const SizedBox(width: 16,),
                                    // AdvancedText("${race.id}")
                                  ],
                                ),
                                Row(children: [
                                  AdvancedText("\$${race.feeUSD}"),
                                  const SizedBox(width: 3,),
                                  Container(
                                    height: 11,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ),
                                  const SizedBox(width: 3,),
                                  AdvancedText("\$${race.prizePoolUSD}"),
                                ],)
                              ],
                            ),
                          )
                          )

                        ],
                      )
                    ],
                  ),
                );

              });
      }
      else if (racesC.races.value.count!=0){
        return const Center(child: Text("No Races"),);
      }else {
        return const Center(child: Text("Something Went Wrong"),);
      }
    }
    );
  }
}

class ShaderElement extends StatelessWidget {
  const ShaderElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Skeleton(height: 80,width: 50),
              ),
            ),
            Expanded(
                flex: 2,
                child:
                Container(
                  padding: const EdgeInsets.fromLTRB(0,5,16,5),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Skeleton(height: 15,width: 170,),
                          Skeleton(height: 13,width: 25,) // 15 25
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Skeleton(height: 15,width: 45,), // 15 45
                          Skeleton(height: 13,width: 40,)
                        ],
                      ),
                      Row(
                        children: const [
                          Skeleton(height: 13,width: 70,), //15 70
                        ],
                      ),
                      Row(children: const [
                        Skeleton(height: 15,width: 100,), // 15 100
                      ],)
                    ],
                  ),
                )
            )

          ],
        )
      ],
    );
  }
}

class TotalEarnings extends StatelessWidget {
  final double total;
  const TotalEarnings(
      this.total,
      {
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (total<=0){
      return AdvancedText("-\$${total.toStringAsFixed(2).replaceFirst("-", "")}",12,FontWeight.normal,Colors.redAccent);
    } else{
      return AdvancedText("+\$${total.toStringAsFixed(2)}",12,FontWeight.normal,Colors.green);
    }
  }
}

String posSuffix(int? position){
  switch (position){
    case 1:
      return "st";
    case 2:
      return "nd";
    case 3:
      return "rd";
    default:
      return "th";
  }
}

String formatDate(String date){
  var date = DateTime.parse('2022-08-03T04:19:45.000Z');
  return "${date.day}/${date.month}/${date.year}";
}
