// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    contactNumber: json['contactNumber'] as String,
    imageUrl: json['imageUrl'] as String,
    address: (json['address'] as List)
        ?.map((e) =>
            e == null ? null : AddressModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    status: _$enumDecodeNullable(_$UserStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'imageUrl': instance.imageUrl,
      'address': instance.address,
      'gender': _$GenderEnumMap[instance.gender],
      'status': _$UserStatusEnumMap[instance.status],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

const _$UserStatusEnumMap = {
  UserStatus.home: 'home',
  UserStatus.traveling: 'traveling',
  UserStatus.shopping: 'shopping',
};
