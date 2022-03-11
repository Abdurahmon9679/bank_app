import 'dart:convert';

import 'package:bank_app/models/card_model.dart';
import 'package:bank_app/services/log_service.dart';
import 'package:http/http.dart';

class Network {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "622ac59e14ccb950d224dea0.mockapi.io";
  static String SERVER_PRODUCTION = "622ac59e14ccb950d224dea0.mockapi.io";

  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await get(uri, headers: getHeaders());
    //Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api); // http or https
    var response =
    await post(uri, headers: getHeaders(), body: jsonEncode(params));
    Log.d(response.body);

    if (response.statusCode == 200 || response.statusCode == 201)
      return response.body;
    return null;
  }


  Future <String?> MULTIPART(String api,String filePath,Map<String,String>params)async{
    var uri = Uri.https(getServer(), api);
    var request = MultipartRequest("POST", uri);

    request.headers.addAll(getHeaders());
    request.fields.addAll(params);
    request.files.add(await MultipartFile.fromPath('picture', filePath));

    var res =await request.send();
    return res.reasonPhrase;
  }



  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api); // http or https
    var response =
    await put(uri, headers: getHeaders(), body: jsonEncode(params));
    Log.d(response.body);

    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api); // http or https
    var response =
    await patch(uri, headers: getHeaders(), body: jsonEncode(params));
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await delete(uri, headers: getHeaders());
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  /* Http Apis */
  static String API_LIST = "api/v1/Cards";
  static String API_CREATE = "api/v1/Cards";
  static String API_UPDATE = "api/v1/Cards/"; //{id}
  static String API_DELETE = "api/v1/Cards/"; //{id}

  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(CardModel card) {
    Map<String, String> params = {};
    params.addAll({
      'userName': card.userName,
      'cvv2': card.cvv2,
      'seriesNumber': card.seriesNumber,
      'expireDate':card.expireDate,});
    return params;
  }

  static Map<String, String> paramsUpdate(CardModel card) {
    Map<String, String> params = {};
    params.addAll({
      'id': card.id.toString(),
      'userName': card.userName,
      'cvv2': card.cvv2,
      'seriesNumber': card.seriesNumber,
      'expireDate':card.expireDate,
    });
    return params;
  }

  /* Http Parsing */

  // static CardModel parsePostList(String body) {
  //   CardModel cards = CardModel.fromJson(body);
  //   return cards;
  // }
}