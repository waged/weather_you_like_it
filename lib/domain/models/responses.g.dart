// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HttpErrorImpl _$$HttpErrorImplFromJson(Map<String, dynamic> json) =>
    _$HttpErrorImpl(
      statusCode: (json['status'] as num?)?.toInt(),
      error: json['error'] as String?,
      message: json['message'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HttpErrorImplToJson(_$HttpErrorImpl instance) =>
    <String, dynamic>{
      'status': instance.statusCode,
      'error': instance.error,
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$NetworkErrorImpl _$$NetworkErrorImplFromJson(Map<String, dynamic> json) =>
    _$NetworkErrorImpl(
      error: json['error'] as String?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NetworkErrorImplToJson(_$NetworkErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'runtimeType': instance.$type,
    };

_$UnexpectedErrorImpl _$$UnexpectedErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$UnexpectedErrorImpl(
      error: json['error'] as String?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnexpectedErrorImplToJson(
        _$UnexpectedErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'runtimeType': instance.$type,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address:
          (json['address'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
