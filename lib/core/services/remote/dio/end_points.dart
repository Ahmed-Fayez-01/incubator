class EndPoints {
  static const baseUrl = 'https://app.hum-l.com/api/';
  static const login = 'provider/providers/login';
  static const register = 'provider/providers/register';
  static const otp = 'provider/providers/checkcode';
  static const allServices = 'user/categories/all';
  static const checkCode = 'provider/providers/password/code/check';
  static const forgetPassword = 'provider/providers/password/email';
  static const profile = 'provider/providers/profile/update-profile';
  static const me = 'provider/me';
  static const logout = 'provider/providers/logout';
  static const loginOSM = 'provider/providers/login/otp';
  static const otpOSM = 'provider/providers/checkcode/otp';
  static const isVerify = 'provider/providers/is_verify';

  // //-------------------------------------------------------------------- Auth

  static const aboutUs = 'home/settings/about-us';
  static const contactUs = 'home/settings/contact-us';
  static const fAQ = 'home/settings/faq';
  static const termAndConditions = 'home/settings/terms';

  // // -------------------------------------------------------------------- Setting

  static const cancelOrderAndSearch = 'provider/providers/cancel/another/driver';
  static const cancelOrderAnyService = 'provider/providers/cancel/services/another/driver';
  static const getAllOrderSchedule = 'provider/get/all/order/schedule';
  static const acceptOrderSchedule = 'provider/accept/order/schedule';
  static const getOrderByID = 'provider/order/by/id';
  static const endTrip = 'provider/end_trip';
  static const finishedOrders = 'provider/get/all/trips';
  static const startTrip = 'provider/start/trip';
  static const addRate = 'provider/add/rates';
  static const addReport = 'api/provider/report/add';

  // // ------------------------------------------------------------  Driver Order

  static const addFurniture = 'provider/add/furniture';
  static const acceptFast = 'provider/fast/accept';
  static const getAllFast = 'provider/fast/all';
  static const getFastByID = 'provider/fast/by/id';
  static const payVisa = 'provider/fast/visa';
  static const payCash = 'provider/fast/cash';
  static const startTripFast = 'provider/fast/start';

  static const endTripFast = 'provider/fast/end';
  static const activeDriver = 'provider/is_active';
  static const sendFastOrder = 'provider/add/furniture';
  static const finishFastOrder = 'provider/fast/end';

  // // ------------------------------------------------------------ Driver Fast Order

  static const getHomeData = 'home/get/all/home';

  static const List<int> successStatueCode = [200, 201];
}
