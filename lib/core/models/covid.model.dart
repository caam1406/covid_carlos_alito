import 'package:json_annotation/json_annotation.dart';

part 'covid.model.g.dart';

@JsonSerializable(nullable: true, anyMap: true)
class CovidModel {
  CovidModel({
    this.state,
    this.cases,
    this.deaths,
    this.region,
  });

  String state;
  int cases;
  int deaths;
  String region;

  factory CovidModel.fromJson(Map json) => _$CovidModelFromJson(json);
  Map<String, dynamic> toJson() => _$CovidModelToJson(this);
}

enum SortCovid { byCases, byDeaths, byState, byRegion }
