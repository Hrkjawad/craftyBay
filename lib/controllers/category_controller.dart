import 'package:craftbay/data/models/category_list_model.dart';
import 'package:craftbay/data/services/network_caller.dart';
import 'package:craftbay/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  CategoryListModel _categoryListModel = CategoryListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  CategoryListModel get categoryListModel => _categoryListModel;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.categoryList);
    _inProgress = false;
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
