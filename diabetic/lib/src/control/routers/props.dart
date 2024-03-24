class RouteParams {
  final String id;
  final String name;
  final String accuracy;
  final String precision;
  final String result;
  RouteParams({
    required this.id,
    required this.name,
    required this.accuracy,
    required this.precision,
    required this.result,
  });
}

class ApiResultRequest {
  final String accuracy;
  final String precision;
  final String result;

  ApiResultRequest(
      {required this.accuracy, required this.precision, required this.result});
}

class ApiRequest {
  final bool error;
  final ApiResultRequest data;
  final String message;

  ApiRequest({required this.error, required this.data, required this.message});
}
