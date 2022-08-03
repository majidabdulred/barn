import 'package:flutter/material.dart';
import 'package:majidapp/commonviews/PropertyView.dart';
import 'package:majidapp/productmodule/models/RaceDataModel.dart';


class PerformanceTabView extends StatelessWidget {
  Chicken chicken;
  PerformanceTabView(this.chicken,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(16, 30, 16, 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(chicken.races != null)PropertLabelLeft("Races","${chicken.races}"),
                      if(chicken.firsts != null)PropertLabelLeft("Firsts","${chicken.firsts}"),
                      if(chicken.seconds != null)PropertLabelLeft("Seconds","${chicken.seconds}"),
                      if(chicken.thirds != null)PropertLabelLeft("Thirds","${chicken.thirds}"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(chicken.earnings != null)PropertLabelRight("Total Earnings","\$${chicken.earnings}"),
                      if(chicken.owner != null)PropertLabelRight("PO Points","${chicken.poPoints}"),
                      if(chicken.heritage != null)PropertLabelRight("Situation","${chicken.situation}")

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
