class Routes {
  static String RAW_URL = 'https://mipuiaw.mizoram.gov.in/';
  static String BASE_URL = '${RAW_URL}api';
  static String IMAGE_URL = '${RAW_URL}storage/';
  static String LOGIN = '$BASE_URL/login';
  static String SEND_OTP = '$BASE_URL/send-otp';
  static String VERIFY_OTP = '$BASE_URL/verify-otp';
  static String REGISTER = '$BASE_URL/register';
  static String LOGOUT = '$BASE_URL/logout';

  //HOME
  static String GET_CAROUSEL = '$BASE_URL/get-carousel';
  static String ME = '$BASE_URL/me';
  static String GET_NODAL_OFFICERS = '$BASE_URL/get-nodal-officers';
  static String GET_DEPARTMENTS = '$BASE_URL/get-department';

  //GRIEVANCE
  static String GET_CREDIT = '$BASE_URL/get-credit';
  static String GET_ALL_GRIEVANCE = '$BASE_URL/get-grievance';
  static String SUBMIT_GRIEVANCE = '$BASE_URL/store-grievance';
  static String GET_GRIEVANCE_DETAILS(int id) => '$BASE_URL/grievance/$id/show';
  static String SUBMIT_FEEDBACK(int id) => '$BASE_URL/grievance/$id/feedback';
  static String PRINT_GRIEVANCE(int id) => '$BASE_URL/grievance/$id/print';
  static String GET_FEEDBACK_CATEGORIES = '$BASE_URL/feedback-category';

  //APPEAL
  static String GET_ALL_APPEAL = '$BASE_URL/appeal/list';
  static String GET_APPEAL_REGISTRATION = '$BASE_URL/appeal';
  static String SUBMIT_APPEAL = '$BASE_URL/appeal/store';
  static String GET_APPEAL_DETAILS(int id) => '$BASE_URL/appeal/$id/detail';
}
