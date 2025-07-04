import 'package:mipuiaw_apps/models/appeal_registration_model.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';

class AppealServices extends BaseService {
  Future<List<AppealRegistrationModel>> getAppealRegistration(filter) async {
    try {
      var response = await client.get(
        Routes.GET_APPEAL_REGISTRATION,
        queryParameters: {"filter": filter},
      );

      final data = response.data['grievances'];
      if (data != null) {
        return AppealRegistrationModel.fromJsonList(data);
      }

      return [];
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
