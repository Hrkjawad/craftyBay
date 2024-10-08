import 'package:craftbay/controllers/brand_list_controller.dart';
import 'package:craftbay/data/utility/app_colors.dart';
import 'package:craftbay/ui/widgets/brand_item.dart';
import 'package:craftbay/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({
    super.key,
  });

  @override
  State<BrandScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<BrandScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BrandListController>().getBrandList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Brands",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.primaryColor,
        color: Colors.white,
        onRefresh: () async {
          Get.find<BrandListController>().getBrandList();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
              GetBuilder<BrandListController>(builder: (brandListController) {
            //BrandListController
            return Visibility(
              visible: brandListController.inProgress == false,
              replacement: const CenterCircularProgressIndicator(),
              child: GridView.builder(
                itemCount: brandListController.branListModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.95,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: BrandItem(
                      brandModel:
                          brandListController.branListModel.data![index],
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
