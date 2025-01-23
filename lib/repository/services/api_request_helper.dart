import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_you_like_it/domain/models/responses.dart';

class ApiRequestHelper {
  static Future<Either<Failure, T>> getRequest<T>({
    required String url,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body) as Map<String, dynamic>;
        return Right(fromJson(responseJson));
      } else {
        return Left(Failure.httpError(
          statusCode: response.statusCode,
          message: "HTTP error",
        ));
      }
    } catch (e) {
      return Left(Failure.unexpected(
        statusCode: -1,
        message: "An unexpected error occurred.",
        error: e.toString(),
      ));
    }
  }
}
