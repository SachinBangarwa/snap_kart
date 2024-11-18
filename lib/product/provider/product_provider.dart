import 'package:flutter/foundation.dart';
import 'package:snap_kart/core/appUtil.dart';
import 'package:snap_kart/product/model/product_model.dart';
import 'package:snap_kart/product/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> product = [];

  ProductProvider(this.productService);

  ProductService productService;
   String? errorMessage;
  Future<void> fetchProduct() async {
    try{
    product = await productService.fetchProduct();
    AppUtil.showToast('achieve product');
    notifyListeners();
  }catch(msg){
     errorMessage=msg.toString();
     notifyListeners();
    }

  }

}

