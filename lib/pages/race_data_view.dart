import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:majidapp/commonmodule/AppColor.dart';
import 'package:majidapp/commonviews/skeletonClass.dart';
import 'package:majidapp/commonviews/textWidget.dart';
import 'package:majidapp/pages/SIngleChickenView.dart';
import 'package:majidapp/productmodule/controllers/raceData_controller.dart';

class RaceDataView extends StatelessWidget {
  // RaceDataController raceData = Get.put(RaceDataController());

  RaceDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    RaceDataController raceData = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("${raceData.model.value.id}"),),
      backgroundColor: AppColor.color1,
      body: ListView.builder(
          itemCount: raceData.model.value.lanes?.length,
          itemBuilder: (context,index){
            var chicken = raceData.model.value.lanes![index].chicken!;
            return GestureDetector(
              onTap: (){
                Get.to(SingleChickenTabView(),arguments: chicken);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: Hero(
                          tag: "${chicken.id}",
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: "${chicken.image}",
                                placeholder: (context, url) => Skeleton(height: 150,width: 100,),
                                errorWidget: (ctx,url,error)=>Icon(Icons.error),
                              )
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0,5,16,5),
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AdvancedText("${chicken.name??chicken.id}",16,FontWeight.w500),
                                    AdvancedText("${chicken.id}",12,FontWeight.w500)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AdvancedText("${chicken.owner}"),
                                    AdvancedText("${chicken.cumulativeSegmentSize?.toStringAsFixed(2)}s",12)
                                  ],
                                ),
                                Row(
                                  children: [
                                    AdvancedText("${chicken.heritage}"),
                                    SizedBox(width: 16,),
                                    AdvancedText("${chicken.perfection}")
                                  ],
                                ),
                                Row(children: [
                                  AdvancedText("${chicken.firsts}"),
                                  SizedBox(width: 3,),
                                  Container(
                                    height: 11,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ),
                                  SizedBox(width: 3,),
                                  AdvancedText("${chicken.seconds}"),
                                  SizedBox(width: 3,),
                                  Container(
                                    height: 11,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ),
                                  SizedBox(width: 3,),
                                  AdvancedText("${chicken.thirds}")
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
          }),
    );
  }
}
