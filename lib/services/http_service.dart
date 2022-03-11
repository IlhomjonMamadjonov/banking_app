import 'dart:convert';
import 'package:http/http.dart';
import 'package:new_one/models/card_model.dart';

class Network {
  /// Set isTester ///
  static bool isTester = true;

  /// Servers Types ///
  static String SERVER_DEVELOPMENT = "622ac5e114ccb950d224e981.mockapi.io";
  static String SERVER_PRODUCTION = "622ac5e114ccb950d224e981.mockapi.io";

  /// * Http Apis *///
  static String API_LIST = "/cardInfo";
  static String API_CREATE = "/cardInfo";
  static String API_DELETE = "/cardInfo"; //{id}

  /// Getting Header ///
  static Map<String, String> getHeaders() {
    Map<String, String> header = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    return header;
  }

  /// Selecting Test Server or Production Server  ///
  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  ///* Http Requests *///
  /// GET method///
  static Future<String?> GET(String api, Map<String, String> params) async {
    Uri uri = Uri.https(getServer(), api, params);
    Response response = await get(uri);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /// POST method///
  static Future<String?> POST(String api, Map<String, String> params) async {
    Uri uri = Uri.https(getServer(), api, params);
    Response response = await post(uri, body: jsonEncode(params),headers: getHeaders());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /// DELETE ///
  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await delete(uri);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /// * Http Params * ///
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  /// Create Post ///
  static Map<String, String> paramsCreate(ModelCard card) {
    Map<String, String> params = {};
    params.addAll({
      'holderName': card.holderName,
      'cardNumber': card.cardNumber,
      'expiryDate': card.expiryDate,
      'cvvCode': card.cvvCode
    });
    return params;
  }
}