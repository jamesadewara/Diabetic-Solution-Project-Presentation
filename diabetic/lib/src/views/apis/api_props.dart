import 'dart:convert';
import 'package:diabetic/src/control/config.dart';
import 'package:diabetic/src/control/routers/props.dart';
import 'package:http/http.dart' as http;

class ApiMsg {
  static const String badRequest = 'Invalid request. Please check your input: ';
  static const String unAuthorized =
      'Authentication failed. Please check your credentials.';
  static const String forbidden =
      'Access forbidden. You do not have permission to perform this action.';
  static const String notFound =
      'Resource not found. Please check the requested endpoint.';
  static const String internalServerError =
      'Oops! Something went wrong on the server. Please try again later.';
  static const String externalServerError =
      'Failed to connect to the server. Please check your internet connection or try again later.';
  static const String defaultError = 'Request failed with status:';
}

class ServiceApi {
  String baseUrl = api["main"]["base_url"];
  Map endpoints = api["main"]["endpoints"];

  Future<ApiRequest> predictResult(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/${endpoints["predict"]}'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }

  ApiRequest _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Successful response
      return ApiRequest(
          error: false,
          data: ApiResultRequest(
            accuracy: json.decode(response.body)["data"]["accuracy"],
            precision: json.decode(response.body)["data"]["precision"],
            result: json.decode(response.body)["data"]["result"],
          ),
          message: "Your request was successfull");
    } else if (response.statusCode == 400) {
      // Handle Bad Request
      return ApiRequest(
          error: true,
          data: ApiResultRequest(accuracy: "", precision: "", result: ""),
          message: '${ApiMsg.badRequest} ${response.body}');
    } else if (response.statusCode == 401) {
      // Handle Unauthorized
      return ApiRequest(
          error: true,
          data: ApiResultRequest(accuracy: "", precision: "", result: ""),
          message: ApiMsg.unAuthorized);
    } else if (response.statusCode == 403) {
      // Handle Forbidden
      return ApiRequest(
          error: true,
          data: ApiResultRequest(accuracy: "", precision: "", result: ""),
          message: ApiMsg.forbidden);
    } else if (response.statusCode == 404) {
      // Handle Not Found
      return ApiRequest(
          error: true,
          data: ApiResultRequest(accuracy: "", precision: "", result: ""),
          message: ApiMsg.notFound);
    } else if (response.statusCode == 500) {
      // Handle Internal Server Error
      return ApiRequest(
          error: true,
          data: ApiResultRequest(accuracy: "", precision: "", result: ""),
          message: ApiMsg.internalServerError);
    } else {
      // Handle other status codes
      return ApiRequest(
        error: true,
        message: ApiMsg.externalServerError,
        data: ApiResultRequest(accuracy: "", precision: "", result: ""),
      );
    }
  }
}
