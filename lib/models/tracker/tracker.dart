import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tracker.g.dart';

@JsonSerializable()
class CovidTracker extends Equatable {
  @JsonKey(name: 'province_name', defaultValue: 0)
  final String provinceName;
  @JsonKey(name: 'confirmed_cases', defaultValue: 0)
  final int confirmedCases;
  @JsonKey(name: 'confirmed_admitted', defaultValue: 0)
  final int confirmedAdmitted;
  @JsonKey(name: 'confirmed_death', defaultValue: 0)
  final int confirmedDeath;
  CovidTracker({
    this.provinceName,
    this.confirmedCases = 0,
    this.confirmedAdmitted = 0,
    this.confirmedDeath = 0,
  });

  factory CovidTracker.fromJson(Map<String, dynamic> json) =>
      _$CovidTrackerFromJson(json);
  Map<String, dynamic> toJson() => _$CovidTrackerToJson(this);
  @override
  List<Object> get props =>
      [provinceName, confirmedCases, confirmedAdmitted, confirmedDeath];

  CovidTracker copyWith({
    String provinceName,
    int confirmedCases,
    int confirmedAdmitted,
    int confirmedDeath,
  }) {
    return CovidTracker(
      provinceName: provinceName ?? this.provinceName,
      confirmedCases: confirmedCases ?? this.confirmedCases,
      confirmedAdmitted: confirmedAdmitted ?? this.confirmedAdmitted,
      confirmedDeath: confirmedDeath ?? this.confirmedDeath,
    );
  }
}
