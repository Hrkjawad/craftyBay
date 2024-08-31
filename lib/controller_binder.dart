import 'package:craftbay/controllers/add_to_cart_controller.dart';
import 'package:craftbay/controllers/auth_controller.dart';
import 'package:craftbay/controllers/brand_list_controller.dart';
import 'package:craftbay/controllers/cart_list_controller.dart';
import 'package:craftbay/controllers/category_controller.dart';
import 'package:craftbay/controllers/complete_profile_controller.dart';
import 'package:craftbay/controllers/create_invoice_controller.dart';
import 'package:craftbay/controllers/create_product_review_controller.dart';
import 'package:craftbay/controllers/create_wish_list_controller.dart';
import 'package:craftbay/controllers/home_banner_controller.dart';
import 'package:craftbay/controllers/list_review_by_product_controller.dart';
import 'package:craftbay/controllers/main_bottom_controller.dart';
import 'package:craftbay/controllers/new_product_controller.dart';
import 'package:craftbay/controllers/policy_controller.dart';
import 'package:craftbay/controllers/popular_product_controller.dart';
import 'package:craftbay/controllers/product_controller.dart';
import 'package:craftbay/controllers/product_details_controller.dart';
import 'package:craftbay/controllers/product_list_by_brand_controller.dart';
import 'package:craftbay/controllers/product_wish_list_controller.dart';
import 'package:craftbay/controllers/read_profile_data_controller.dart';
import 'package:craftbay/controllers/send_email_otp_controller.dart';
import 'package:craftbay/controllers/special_product_controller.dart';
import 'package:craftbay/controllers/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOTPController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(CreateInvoiceController());
    Get.put(CreateWishListController());
    Get.put(ProductWishListController());
    Get.put(PolicyController());
    Get.put(BrandListController());
    Get.put(ProductListByBrandController());
    Get.put(ListReviewByProductController());
    Get.put(CreateProductReviewController());
  }
}
