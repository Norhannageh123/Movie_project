// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesListResponseDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListResponseDM _$MoviesListResponseDMFromJson(
        Map<String, dynamic> json) =>
    MoviesListResponseDM(
      status: json['status'] as String?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] == null
          ? null
          : MoviesData.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['@meta'] == null
          ? null
          : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesListResponseDMToJson(
        MoviesListResponseDM instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
      '@meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      serverTime: (json['serverTime'] as num?)?.toInt(),
      serverTimezone: json['serverTimezone'] as String?,
      apiVersion: (json['apiVersion'] as num?)?.toInt(),
      executionTime: json['executionTime'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'serverTime': instance.serverTime,
      'serverTimezone': instance.serverTimezone,
      'apiVersion': instance.apiVersion,
      'executionTime': instance.executionTime,
    };
