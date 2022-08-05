import 'package:flutter/material.dart';
class InfiniteScrolling extends StatefulWidget {
  const InfiniteScrolling({Key? key}) : super(key: key);

  @override
  State<InfiniteScrolling> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InfiniteScrolling> {
  final ScrollController _scrollController = ScrollController();
  
  List<String> items = [];
  bool loading = false,allLocated=false;
  
  mockFectch()async{
    if (allLocated){
      return;
    }
    setState(() {
      loading=true;
    });
    await Future.delayed(Duration(seconds: 1));
    List<String> newData = items.length>=60?[]:List.generate(20, (index) => "List Item ${index+items.length}");
    if (newData.isNotEmpty){
      items.addAll(newData);
    }
    setState(() {
      loading=false;
      allLocated=newData.isEmpty;
    });
  }
  
  @override
  void initState() {
    super.initState();
    mockFectch();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels>= _scrollController.position.maxScrollExtent && !loading){
        mockFectch();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Infinte Scroolling"),
      ),
      body: LayoutBuilder(builder: (context,constraints){
        if(items.isNotEmpty){
          return Stack(
            children: [ListView.separated(
              controller: _scrollController,
                itemBuilder: (context,index){
                  if(index<items.length){
                    return ListTile(title: Text(items[index]));
                  }else{
                    return Container(
                      width: constraints.maxWidth,
                      height: 50,
                      child: Center(
                        child: Text("Nothing more to show"),
                      ),
                    );
                  }
                },
                separatorBuilder: (context,index){
                  return Divider();
                },
                itemCount: items.length+(allLocated?1:0)),
            if(loading)...[
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: constraints.maxWidth,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))
            ]
            ]
          );
        }else{
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },),
    );
  }
}
