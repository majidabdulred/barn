import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majidapp/commonmodule/AppString.dart';
import 'package:majidapp/productmodule/controllers/product_controller.dart';
import 'package:majidapp/commonmodule/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majidapp/util/skeletonClass.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productList),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
      // if (false){
          return ListView.separated(
              itemBuilder: (context, index) => const ListSkeletonWidget(),
              separatorBuilder: (context,index)=> const SizedBox(height: 16),
              itemCount: 10);
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return buildColumnProducts(index,context);
            },
          );
        }
      }),
    );
  }


  Column buildColumnProducts(int index,BuildContext context) {
    return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: productController.productList[index].imageLink,
                          placeholder: (context, url) => Skeleton(height: 150,width: 100,),
                          errorWidget: (ctx,url,error)=>Icon(Icons.error),
                        )
                      ),
                    ),
                    Flexible(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewText(
                            string: productController.productList[index].name,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        NewText(
                          string:productController.productList[index].brand,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                           ),
                        Text(productController.productList[index].category.toString(),style: TextStyle(fontSize: 14,color: Colors.grey),)
                      ],
                    ))
                  ],
                ),
                Container(color: AppColor.grey200,
                height: 2,)
              ],
            );
  }
}

class NewText extends StatelessWidget {
  const NewText(
      {
    Key? key, required this.string, required this.fontSize, this.fontWeight=FontWeight.w400,
  }) : super(key: key);

  final String string;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: GoogleFonts.ubuntu(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class ListSkeletonWidget extends StatelessWidget {
  const ListSkeletonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: ClipRRect(
                child: Skeleton(height: 150,width: 100,)
              ),
            ),
            Flexible(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(width:150 ,height: 12,),
                SizedBox(height: 10,),
                Skeleton(width:80 ,height: 12,),
                SizedBox(height: 10,),

                Skeleton(width:80 ,height: 12,)
              ],
            ))
          ],
        ),


        Container(color: AppColor.grey200,
          height: 2,)
      ],
    );
  }
}

