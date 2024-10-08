import 'package:craftbay/data/models/product_list_model.dart';
import 'package:craftbay/data/services/network_caller.dart';
import 'package:craftbay/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  ProductListModel _productListModel = ProductListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  ProductListModel get productListModel => _productListModel;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.specialProduct);
    _inProgress = false;
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
