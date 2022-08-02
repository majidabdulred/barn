import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majidapp/commonviews/PropertyView.dart';
import 'package:majidapp/commonviews/skeletonClass.dart';

import 'package:majidapp/productmodule/models/RaceDataModel.dart';
class BasicTabView extends StatelessWidget {
  final Chicken chicken;
  const BasicTabView(
      this.chicken,
      {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // RaceDataController raceData = Get.find<RaceDataController>();
    return Container(
      padding: EdgeInsets.fromLTRB(16, 30, 16, 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "${chicken.id}",
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 150,
                            width: 150,
                            imageUrl: "${chicken.image}",
                            placeholder: (context, url) => Skeleton(height: 150,width: 150,),
                            errorWidget: (ctx,url,error)=>Icon(Icons.error),
                          )
                      ),
                    ),
                    SizedBox(height: 45,),
                    if(chicken.stripes != null)PropertLabelLeft("Stripes", "${chicken.stripes}"),
                    if(chicken.beakAccessory != null)PropertLabelLeft("beakAccessory", "${chicken.beakAccessory}"),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(chicken.id != null)PropertLabelRight("Id","${chicken.id}"),
                      if(chicken.name != null)PropertLabelRight("Name","${chicken.name}"),
                      if(chicken.owner != null)PropertLabelRight("Owner","${chicken.owner}"),
                      if(chicken.heritage != null)PropertLabelRight("Heritage","${chicken.heritage}"),
                      if(chicken.perfection != null)PropertLabelRight("Perfection","${chicken.perfection}"),
                      if(chicken.talent != null)PropertLabelRight("Talent","${chicken.talent}".replaceAll("?", "")),
                      if(chicken.gender != null)PropertLabelRight("Gender","${chicken.gender}"),
                      if(chicken.baseBody != null)PropertLabelRight("Body","${chicken.baseBody}"),
                      if(chicken.eyesType != null)PropertLabelRight("Eyes","${chicken.eyesType}"),
                      if(chicken.background != null)PropertLabelRight("Background","${chicken.background}"),
                      if(chicken.stock != null)PropertLabelRight("Stock","${chicken.stock}"),

                    ],
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}

