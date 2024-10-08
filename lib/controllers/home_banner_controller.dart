import 'package:craftbay/data/models/banner_list_model.dart';
import 'package:craftbay/data/services/network_caller.dart';
import 'package:craftbay/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeBannerController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  BannerListModel _bannerListModel = BannerListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  BannerListModel get bannerListModel => _bannerListModel;

  Future<bool> getBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBanner);
    _inProgress = false;
    if (response.isSuccess) {
      _bannerListModel = BannerListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
