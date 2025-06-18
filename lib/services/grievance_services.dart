import 'package:mipuiaw_apps/controllers/grievance_model.dart';
import 'package:mipuiaw_apps/models/department_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mipuiaw_apps/routes.dart';
import 'package:mipuiaw_apps/services/base_services.dart';

class GrievanceServices extends BaseService {
  Future<List<DepartmentModel>> getDepartment(filter) async {
    var response = await client.get(
      Routes.GET_DEPARTMENTS,
      queryParameters: {"filter": filter},
    );

    final data = response.data['departments'];
    if (data != null) {
      return DepartmentModel.fromJsonList(data);
    }

    return [];
  }

  Future getCredit() async {
    try {
      var response = await client.get(Routes.GET_CREDIT);
      return response;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future getAllGrievance() async {
    try {
      var response = await client.get(Routes.GET_ALL_GRIEVANCE);
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future submitGrievance(dio.FormData formData) async {
    try {
      print(formData.files);
    } catch (ex) {}
  }
}
