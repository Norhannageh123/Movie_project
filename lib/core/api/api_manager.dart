import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/api/api_constants.dart';

@Singleton()
class ApiManager {
  ApiManager._();
  static final ApiManager _instance = ApiManager._();
  static ApiManager get instance => _instance;

  Future<Either<Failures, dynamic>> request({
    required String endpoint,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return Left(NetworkError(errorMessage: 'Please check your internet connection'));
    }

   Uri url = Uri.parse('${ApiConstants.baseUrl}$endpoint');

    http.Response response;

    try {
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(url);
          break;
        case 'POST':
          response = await http.post(
            url,
            body: jsonEncode(body),
            headers: {'Content-Type': 'application/json'},
          );
          break;
        case 'PATCH':
          response = await http.patch(
            url,
            body: jsonEncode(body),
            headers: {'Content-Type': 'application/json'},
          );
          break;
        case 'DELETE':
          response = await http.delete(url);
          break;
        default:
          return Left(ServerError(errorMessage: 'Invalid HTTP Method'));
      }

      print(response.body);
      print(response.statusCode);
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(jsonResponse);
      } else {
        return Left(ServerError(errorMessage: jsonResponse['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: 'Request failed: $e'));
    }
  }
}
