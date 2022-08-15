import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/chickenmodule/models/RaceDataModel.dart';
import 'package:majidapp/views/BasicTabView.dart';
import 'package:majidapp/views/PerformanceTabView.dart';
import 'package:majidapp/views/RacesTabView.dart';

class SingleChickenTabView extends StatefulWidget {
  const SingleChickenTabView({Key? key}) : super(key: key);
  @override
  State<SingleChickenTabView> createState() => _SingleChickenTabViewState();
}

class _SingleChickenTabViewState extends State<SingleChickenTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    // _tabController.addListener(() {
    //   if (_tabController.index==2){
    //
    //   }
    // })
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
            Tab(text: 'PERFORMANCE'),
            Tab(
              text: "RACES",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BasicTabView(chicken),
          PerformanceTabView(chicken),
          RacesTabView(chicken.id),
        ],
      ),
    );
  }
}
