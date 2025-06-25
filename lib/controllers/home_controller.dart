import 'package:get/get.dart';
import 'package:mipuiaw_apps/models/carousel_model.dart';
import 'package:mipuiaw_apps/services/home_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController {
  HomeServices services = Get.find(tag: 'homeServices');
  late YoutubePlayerController youtubePlayerController;
  var pdfList = [
    {
      'url': 'https://rti.mizoram.gov.in/images/rti.pdf',
      'icon': 'images/youtube.svg',
      'name': 'Video',
      'file_name': 'rti.pdf'
    },
    {
      'url': 'https://rti.mizoram.gov.in/images/guidelines.pdf',
      'icon': 'images/file.svg',
      'name': 'Mizo',
      'file_name': 'guidelines.pdf'
    },
    {
      'url': 'https://rti.mizoram.gov.in/my/tc',
      'icon': 'images/file.svg',
      'name': 'English',
      'file_name': ''
    }
  ];
  var carouselList = [
    {
      'image': 'images/banner1.jpg',
    },
    {
      'image': 'images/banner2.jpg',
    }
  ];
  var isMizo = true.obs;

  var carouselData = <CarouselModel>[].obs;
  @override
  void onInit() {
    getCarouselData();
    super.onInit();
  }

//CALL
  void getCarouselData() async {
    carouselData.clear();
    try {
      var response = await services.getCarouselData();
      carouselData.assignAll(response);
    } catch (ex) {
      print(ex);
    }
  }
}
