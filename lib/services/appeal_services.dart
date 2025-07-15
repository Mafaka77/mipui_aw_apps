import 'package:mipuiaw_apps/models/appeal_registration_model.dart';
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';

class AppealServices extends BaseService {
  Future getAllAppeal() async {
    try {
      var response = await client.get(Routes.GET_ALL_APPEAL);
      final data = response.data['appeals'];
      if (data != null) {
        return data;
      }
      return [];
    } catch (ex) {
      return Future.error(ex);
    }
  }

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

  Future submitAppeal({
    required int grievanceId,
    required String reason,
  }) async {
    try {
      var response = await client.post(
        Routes.SUBMIT_APPEAL,
        data: {
          "grievance_id": grievanceId,
          "reason": reason,
        },
      );
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future getAppealDetails(int id) async {
    try {
      var response = await client.get(
        Routes.GET_APPEAL_DETAILS(id),
      );

      if (response.data != null) {
        return response.data['appeal'];
      }
      return [];
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
