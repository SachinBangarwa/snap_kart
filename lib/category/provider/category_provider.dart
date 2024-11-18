import 'package:flutter/foundation.dart';
import 'package:snap_kart/category/model/category_model.dart';
import 'package:snap_kart/category/service/category_service.dart';
import 'package:snap_kart/core/appUtil.dart';

class CategoryProvider extends ChangeNotifier{
  CategoryProvider(this.categoryService);
  CategoryService categoryService;
   List<CategoryResponse> _category=[];
  List<CategoryResponse> get category=>_category;

  Future<void> fetchCategory()async{
    try {
      _category = await categoryService.fetchCategory();
      notifyListeners();
      AppUtil.showToast('success');
    }catch(e){
      AppUtil.showToast(e.toString());
    }
  }


}