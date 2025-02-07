import 'package:json_annotation/json_annotation.dart';

import '../../../domain/home/entities/MoviesListEntity.dart';
part 'MoviesListResponseDM.g.dart';


@JsonSerializable()
class MoviesListResponseDM extends MoviesListEntity {
  MoviesListResponseDM({
    super.status,
    super.statusMessage,
    super.data,
    this.meta,
  });

  @JsonKey(name: '@meta')
  Meta? meta;

  factory MoviesListResponseDM.fromJson(Map<String, dynamic> json) =>
      _$MoviesListResponseDMFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MoviesListResponseDMToJson(this);
}

@JsonSerializable()
class Meta {
  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
