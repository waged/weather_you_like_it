// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'responses.freezed.dart';
part 'responses.g.dart';

@freezed
class Failure with _$Failure {
  // Represents an API error with status code and error message
  const factory Failure.httpError(
      {@JsonKey(name: "status") required int? statusCode,
      required String? error,
      required String? message}) = _HttpError;

  // Represents network issues (e.g., no internet connection)
  const factory Failure.network({
    required String? error,
    required String? message,
    required int? statusCode,
  }) = _NetworkError;

  // Represents unexpected exceptions
  const factory Failure.unexpected({
    required String? error,
    required String? message,
    required int? statusCode,
  }) = _UnexpectedError;

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    required String? firstName,
    required String? lastName,
    required String? email,
    required List<String>? phone,
    required List<String>? address,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
