import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:mipuiaw_apps/controllers/home_controller.dart';
import 'package:mipuiaw_apps/routes.dart';

class CarouselWidget extends GetView<HomeController> {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => FlutterCarousel(
          options: FlutterCarouselOptions(
            height: Get.height * 0.23,
            showIndicator: true,
            slideIndicator: CircularSlideIndicator(),
            disableCenter: true,
            viewportFraction: 1.0,
          ),
          items: controller.carouselData.asMap().entries.map((entry) {
            int index = entry.key;
            final imageUrl = '${Routes.IMAGE_URL}carousel/${entry.value.image}';

            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  height: Get.height * 0.23, // Match carousel height
                  margin:
                      EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
