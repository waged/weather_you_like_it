// ignore_for_file: constant_identifier_names

class Constants {
  static const APP_USER_VERSION = "0.0.1";
  static const URL = "https://things-connect.net/regal/api/";

  static const String PRIVACY_AND_TERMS_URL =
      "https://things-connect.net/legal-info";

//ACCOUNT
  static const URL_REGISTER = '${URL}user/register';
  static const URL_LOGIN = '${URL}user/login';
  static const URL_RESET_PASSWORD = '${URL}user/forgot-password';
  static const URL_REFRESH_TOKEN = '${URL}user/refresh-token';
  static const URL_ACCOUNT = '${URL}user/account';
  static const URL_LOGOUT = '${URL}user/logout';

//company get
  static const URL_CREATE_COMPANY = '${URL}company/add';
  static const URL_GET_COMPANIES = '${URL}company/get';

  //products
  static const URL_CREATE_PRODUCT = '${URL}product/add';
  static const URL_GET_ALL_PRODUCTS = '${URL}product/all';
  static const URL_GET_PRODUCTS = '${URL}product/get';
  static const URL_GET_PRODUCT = '${URL}product';
  static const URL_POST_PRODUCT_IMAGE = '${URL}product/images';
   static const URL_DELETE_PRODUCT_IMAGE = '${URL}product/image';
  static const URL_UPDATE_PRODUCT = '${URL}product/edit';


}
