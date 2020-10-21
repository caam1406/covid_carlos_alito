// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidModel _$CovidModelFromJson(Map json) {
  return CovidModel(
    state: json['state'] as String,
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$CovidModelToJson(CovidModel instance) =>
    <String, dynamic>{
      'state': instance.state,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'region': instance.region,
    };
