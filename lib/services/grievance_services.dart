import 'package:dio/dio.dart';
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

  Future getAllGrievance(int offset, int limit) async {
    try {
      var response =
          await client.get(Routes.GET_ALL_GRIEVANCE, queryParameters: {
        "offset": offset,
        "limit": limit,
      });
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future getGrievanceDetails(String grievanceId) async {
    try {
      var response = await client.get(
        Routes.GET_GRIEVANCE_DETAILS(int.parse(grievanceId)),
      );

      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future submitGrievance(dio.FormData formData) async {
    // print(formData.fields);
    try {
      var response = await client.post(
        Routes.SUBMIT_GRIEVANCE,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future submitFeedback(
      int id, String regNo, String priority, String comment) async {
    print(id);
    try {
      var response = await client.post(
        Routes.SUBMIT_FEEDBACK(id),
        data: {
          "category": priority,
          "feedback": comment,
        },
      );
      return response;
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }
}
