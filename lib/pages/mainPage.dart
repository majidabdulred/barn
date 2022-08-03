import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:majidapp/commonmodule/AppColor.dart';
import 'package:majidapp/commonviews/textWidget.dart';
import 'package:majidapp/pages/race_data_view.dart';
import 'package:majidapp/chickenmodule/controllers/raceData_controller.dart';


class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final inpurt_race_id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color1,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColor.color1,
        title: AdvancedText("ChickenDerby",25,FontWeight.w700,AppColor.color4),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSeachDelegate());
              },
              icon: Icon(Icons.search,color: AppColor.color4,))
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          if (inpurt_race_id.text.isNotEmpty)
          {
            Get.to(RaceDataView(),arguments: inpurt_race_id.text);
          }
        },
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
              color: AppColor.color4
          ),
          child: Center(
            child: AdvancedText("SUBMIT",20,FontWeight.w600),
          ),

        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                controller: inpurt_race_id,
                decoration: InputDecoration(
                  labelText: "RaceID",
                  labelStyle: TextStyle(fontSize: 20,color: AppColor.color4,fontFamily: "Roboto"),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColor.color3)),
                  border: OutlineInputBorder()
                ),
                textAlign: TextAlign.center,
                maxLength: 5,
                keyboardType: TextInputType.number,

              ),
            ),
            SizedBox(height: 100,)
            ,
              // Obx((){
              //   if (raceData.isLoading.value){
              //     return SizedBox(
              //       height: 30,
              //         child: CircularProgressIndicator());
              //   }
              //   else {
              //     return SizedBox(height: 30,);
              //   }
              // })
          ],
        ),
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
          icon: const Icon(Icons.clear,color: AppColor.color4,)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),color: AppColor.color4,);
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
            title: NormalText(matchQuery[index],16),
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
            title: NormalText(matchQuery[index],16),
          );
        });
  }
}


class BasePage extends StatelessWidget {
  BasePage({Key? key}) : super(key: key);
  RaceDataController raceData = Get.put(RaceDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
