import 'dart:developer';
import 'package:craftbay/data/models/complete_profile_model.dart';
import 'package:craftbay/data/models/create_profile_params.dart';
import 'package:craftbay/data/services/network_caller.dart';
import 'package:craftbay/data/utility/urls.dart';
import 'package:craftbay/controllers/auth_controller.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = "";

  CompleteProfileModel _completeProfileModel = CompleteProfileModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  CompleteProfileModel get completeProfileModel => CompleteProfileModel();

  Future<bool> createProfileData(
      String token, CreateProfileParams params) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: params.toJson());
    log(token);
    _inProgress = false;
    if (response.isSuccess) {
      _completeProfileModel =
          CompleteProfileModel.fromJson(response.responseData["data"]);
      await Get.find<AuthController>()
          .saveUserDetails(token, null, _completeProfileModel);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}