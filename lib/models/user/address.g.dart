// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
    streetName: json['streetName'] as String,
    barangay: json['barangay'] as String,
    city: json['city'] as String,
    zipCode: json['zipCode'] as String,
    province: json['province'] as String,
  );
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'streetName': instance.streetName,
      'barangay': instance.barangay,
      'city': instance.city,
      'zipCode': instance.zipCode,
      'province': instance.province,
    };
