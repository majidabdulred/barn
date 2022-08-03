import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/productmodule/models/RaceDataModel.dart';
import 'package:majidapp/views/BasicTabView.dart';
import 'package:majidapp/views/PerformanceTabView.dart';

class SingleChickenTabView extends StatefulWidget {
  const SingleChickenTabView({ Key? key }) : super(key: key);


  @override
  State<SingleChickenTabView> createState() => _SingleChickenTabViewState();
}

class _SingleChickenTabViewState extends State<SingleChickenTabView> with SingleTickerProviderStateMixin {
  // RaceDataController raceData = Get.put(RaceDataController());
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Chicken chicken = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'BASIC INFO'),
            Tab(text: 'RIGHT'),
            Tab(text: "Third",)
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BasicTabView(chicken),
          PerformanceTabView(chicken),
          Text("This is This is Third"),
          // Text("This is This is Third"),
          // Text("This is This is Third"),

    ],
    ),
    );
  }
}

