import 'package:mipuiaw_apps/models/carousel_model.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';

class HomeServices extends BaseService {
  Future<List<CarouselModel>> getCarouselData() async {
    try {
      var response = await client.get(Routes.GET_CAROUSEL);
      return CarouselModel.fromJsonList(response.data['data']);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
