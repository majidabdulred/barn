import 'package:majidapp/productmodule/models/product_model.dart';
import 'package:majidapp/apimodule/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading.value = true;
      Future.delayed(Duration(seconds: 2));
      var products = await ApiService.fetchProduct();
      if (products.isNotEmpty){
        productList.assignAll(products);
      }

    }
    finally{
      isLoading.value = false;
    }

  }
}