// ignore_for_file: constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:weather_you_like_it/api/api_keys.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/repository/app_repo.dart';
import 'package:weather_you_like_it/resources/url_manager.dart';
import 'package:weather_you_like_it/utils/log_utils.dart';

const String APPLICATION_JSON = "application/json";
const String MULTIPART_FORM_DATA = "multipart/form-data";
const String CONTENT_TYPE = "Content-Type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "Authorization";
const String CACHE_CONTROL = "Cache-Control";
const String NO_CACHE = "no-cache";

class AppRepoImpl implements IAppRepo {
  AppRepoImpl();

  //________________________________THE_REQUESTS________________________________

  Either<Failure, T> _handleSuccessResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (response.body.isNotEmpty && !response.body.contains('DOCTYPE HTML')) {
      try {
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
        return Right(fromJson(responseJson));
      } catch (e) {
        logDebug("Failed to parse JSON: $e");
        return Left(Failure.unexpected(
          statusCode: 200,
          message: "failure_parsing",
          error: 'Failed to parse response: $e',
        ));
      }
    }

    // Handle cases where the response is empty or likely a webpage
    return Right(fromJson({'code': 200}));
  }

  Either<Failure, T> _handleErrorResponse<T>(http.Response response) {
    logDebug("Request failed with status: ${response.statusCode}");
    logDebug("Error body: ${response.body}");

    return Left(
      Failure.httpError(
        statusCode: response.statusCode,
        message: "failure_http",
      ),
    );
  }

  Future<Either<Failure, T>> _getRequest<T>({
    required String url,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
  }) async {
    // Set default headers if none are provided
    final effectiveHeaders = headers ??
        {
          CONTENT_TYPE: APPLICATION_JSON,
          ACCEPT: APPLICATION_JSON,
          CACHE_CONTROL: NO_CACHE,
        };

    try {
      // Execute HTTP GET request
      final response =
          await http.get(Uri.parse(url), headers: effectiveHeaders);

      // Log the status and response body
      logDebug("Response_status: ${response.statusCode}");
      logDebug("Response_body: ${response.body}");

      // Handle response
      if (response.statusCode == 200) {
        return _handleSuccessResponse(response, fromJson);
      } else {
        return _handleErrorResponse(response);
      }
    } catch (e, stackTrace) {
      logDebug("Request failed in catch: $e");
      logDebug("Stack trace: $stackTrace");
      return Left(Failure.unexpected(
        statusCode: -1,
        message: "failure_catch",
        error: 'An unexpected error occurred: $e',
      ));
    }
  }

  //________________________________REAL-WORLD REQUESTS________________________________

  @override
  Future<Either<Failure, WeatherResponse>> getWeatherData(
    double lat,
    double lon,
  ) async {
    final url =
        '${UrlManager.baseCurrentWeatherUrl}?lat=$lat&lon=$lon&lang=DE&units=metric&appid=${APIKeys.openWeatherAPIKey}';
    return await _getRequest<WeatherResponse>(
      url: url,
      fromJson: (json) => WeatherResponse.fromJson(json),
    );
  }
}
