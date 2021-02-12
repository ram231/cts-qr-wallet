// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidTracker _$CovidTrackerFromJson(Map<String, dynamic> json) {
  return CovidTracker(
    provinceName: json['province_name'] as String ?? 0,
    confirmedCases: json['confirmed_cases'] as int ?? 0,
    confirmedAdmitted: json['confirmed_admitted'] as int ?? 0,
    confirmedDeath: json['confirmed_death'] as int ?? 0,
  );
}

Map<String, dynamic> _$CovidTrackerToJson(CovidTracker instance) =>
    <String, dynamic>{
      'province_name': instance.provinceName,
      'confirmed_cases': instance.confirmedCases,
      'confirmed_admitted': instance.confirmedAdmitted,
      'confirmed_death': instance.confirmedDeath,
    };
