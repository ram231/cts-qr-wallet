import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressModel extends Equatable {
  final String streetName;
  final String barangay;
  final String city;
  final String zipCode;
  final String province;
  AddressModel({
    this.streetName,
    this.barangay,
    this.city,
    this.zipCode,
    this.province,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  AddressModel copyWith({
    String streetName,
    String barangay,
    String city,
    String zipCode,
    String province,
  }) {
    return AddressModel(
      streetName: streetName ?? this.streetName,
      barangay: barangay ?? this.barangay,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      province: province ?? this.province,
    );
  }

  @override
  List<Object> get props {
    return [
      streetName,
      barangay,
      city,
      zipCode,
      province,
    ];
  }
}
