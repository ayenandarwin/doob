import 'package:http/http.dart' as http;

class ApiUrl {
  ApiUrl(_);

  static var client = http.Client();

  static const String mainUrl = "https://doob.smartcodemm.com/api";

  // static const String mainUrlForUri = "newbrdemo.icgwebdevelopment.com";
  static const String mainUrlForUri = "https://newbr.icgwebdevelopment.com";

  static const String movieListUrl =
      "$mainUrl/title/get-videos?tconst=tt0944947&limit=7&region=MM";
  static const String adsListUrl = "$mainUrl/advertises";

  //Contact
  static const String contactUrl = "$mainUrl/contact";

  //Joker App Play Store Link
  static const String playStoreLink =
      "https://play.google.com/store/apps/details?id=com.lucky.seven_mm";

  //Auth
  static const String registerUrl = "$mainUrl/customer/register/phone";
  static const String loginUrl = "$mainUrl/customer/login";
  static const String profileUrl = "$mainUrl/delimens/profile";
  static const String passwordResetUrl = "$mainUrl/delimens/changepassword";
  static const String logout = "$mainUrl/delimens/logout";
  static const String editProfile = "$mainUrl/delimens/edit";
  static const String addWayWithPhoto = "$mainUrl/addway_with_photo";
  static const String addWithQRCode = "$mainUrl/add_way_qr";
  static const String donePickup = "$mainUrl/pickup";
  static const String updateAvatar = "$mainUrl/update_avatar";
  static const String getProfile = "$mainUrl/delimens/profile";
  static const String changePassword = "$mainUrl/delimens/changepassword";
  static const String pickupRequest = "$mainUrl/pickup_request";
  static const String pickupProcess = "$mainUrl/pickup_process";
  static const String pickupDone = "$mainUrl/pickup_done";
  static const String pickedup = "$mainUrl/pickedup";
  static const String pickup_ways = "$mainUrl/pickup_ways";
  static const String delete_ways = "$mainUrl/delete_way";
  static const String deliveryGetWay = "$mainUrl/delivery/getway";
  static const String deliveryGetWayList = "$mainUrl/delivery/getway_list";
  static const String deliverytransferToWH =
      "$mainUrl/delivery/transfer_towh_list";
  static const String deliveryProcessList = "$mainUrl/delivery/processlist";
  static const String deliveryDone = "$mainUrl/delivery/done";
  static const String sendToWHPost = "$mainUrl/delivery/send_towh";
  static const String returnParcel = "$mainUrl/delivery/return_parcel";
  static const String cancelParcel = "$mainUrl/delivery/return_parcel";
  static const String deliveryDoneList = "$mainUrl/delivery/done_list";
  static const String deliveryReturnList = "$mainUrl/delivery/return_list";
  static const String cancelList = "$mainUrl/delivery/cancel_list";
  static const String albumList = "$mainUrl/customer/albums";
  static const String artistList = "$mainUrl/customer/artists";
  static const String profile = "$mainUrl/customer/profile";
  static const String sliderList = "$mainUrl/sliders/index";


  static const String signUpUrl = "$mainUrl/register";
  static const String signUpFirstStepUrl = "$mainUrl/create-login";
  static const String referralCodeCheck = "$mainUrl/verify-token";
  //Request, Forgot, Reset Password
  // static const String passwordResetUrl = "$mainUrl/delimens/changepassword";
  static const String forgetPassword = "$mainUrl/password/create";
  static const String resetPassword = "$mainUrl/password/reset";
  static const String checkToken = "$mainUrl/verify";
  // static const String logout = "$mainUrl/delimens/logout";

  //static List<PickedUp> pickups = [];

  //Profile
  // static const String profileUrl = "$mainUrl/delimens/profile";
  // static const String editProfile = "$mainUrl/delimens/edit";
}
