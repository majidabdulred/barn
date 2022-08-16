import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/chickenmodule/controllers/home_view_cont.dart';
import 'package:majidapp/commonmodule/AppColor.dart';
import 'package:majidapp/commonviews/textWidget.dart';
import 'package:majidapp/views/open_races_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyTabController _tabx = Get.put(MyTabController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.color4,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSeachDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
          title:
              AdvancedText("ChickenDerby", 25, FontWeight.w700, Colors.white),
          bottom: TabBar(
            labelColor: AppColor.color4,
            unselectedLabelColor: AppColor.color1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(left: 4, right: 4),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.white,
            ),
            controller: _tabx.controller,
            tabs: [
              TabHeading("Open", _tabx.controller.index == 0),
              TabHeading("Scheduled", _tabx.controller.index == 1),
              TabHeading("Results", _tabx.controller.index == 2)
            ],
          ),
        ),
        body: TabBarView(
            controller: _tabx.controller,
            children: [OpenRacesView(), Text("Hello"), Text("Hello")]),
      ),
    );
  }
}

class TabHeading extends StatelessWidget {
  final String text;
  final bool isActive;
  const TabHeading(
    this.text,
    this.isActive, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(isActive);
    return Tab(
      child: Container(
        decoration: BoxDecoration(),
        child: Center(
            child: Text(
          "$text",
          style: TextStyle(
              fontFamily: "Nunito", fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class CustomSeachDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Pear",
    "WaterMelons",
    "Oranges",
    "Blueberries",
    "Strawberries",
    "Rasperberries"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.clear,
            color: AppColor.color4,
          )),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
      color: AppColor.color4,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: NormalText(matchQuery[index], 16),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: NormalText(matchQuery[index], 16),
          );
        });
  }
}
