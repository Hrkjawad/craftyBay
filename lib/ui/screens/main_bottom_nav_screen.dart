import 'package:craftbay/controllers/brand_list_controller.dart';
import 'package:craftbay/controllers/category_controller.dart';
import 'package:craftbay/controllers/home_banner_controller.dart';
import 'package:craftbay/controllers/main_bottom_controller.dart';
import 'package:craftbay/controllers/new_product_controller.dart';
import 'package:craftbay/controllers/popular_product_controller.dart';
import 'package:craftbay/controllers/special_product_controller.dart';
import 'package:craftbay/ui/screens/cart_list_screen.dart';
import 'package:craftbay/ui/screens/category_screen.dart';
import 'package:craftbay/ui/screens/home_screen.dart';
import 'package:craftbay/ui/screens/wishlist_screen.dart';
import 'package:craftbay/data/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeBannerController>().getBannerList();
      Get.find<CategoryController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<SpecialProductController>().getSpecialProductList();
      Get.find<NewProductController>().getNewProductList();
      Get.find<BrandListController>().getBrandList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "Carts"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.card_giftcard,
                ),
                label: "WishList"),
          ],
        ),
      );
    });
  }
}
