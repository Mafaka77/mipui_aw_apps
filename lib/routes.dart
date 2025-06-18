class Routes {
  static String BASE_URL = 'https://staging2.egovmz.in/api';
  static String IMAGE_URL = 'https://staging2.egovmz.in/storage/';
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
}
