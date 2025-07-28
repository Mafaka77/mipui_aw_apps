import 'package:mipuiaw_apps/models/nodal_officer_model.dart';
import 'package:mipuiaw_apps/models/user_model.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';

class ProfileServices extends BaseService {
  Future logout() async {
    try {
      var response = await client.get(Routes.LOGOUT);
      print(response);
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future<UserModel> me() async {
    try {
      var response = await client.get(Routes.ME);
      return UserModel.fromJson(response.data['data']);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<NodalOfficerModel>> getNodalOfficers(
      int offset, int limit) async {
    try {
      var response =
          await client.get(Routes.GET_NODAL_OFFICERS, queryParameters: {
        'offset': offset,
        'limit': limit,
      });
      return NodalOfficerModel.fromJsonList(response.data['data']);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
