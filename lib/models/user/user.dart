import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'user.g.dart';

enum Gender { male, female }
enum UserStatus { home, traveling, shopping }

@JsonSerializable()
class UserModel extends Equatable {
  final String id;
  final String email;
  final String password;
  final String name;
  final String contactNumber;
  final String imageUrl;
  final List<AddressModel> address;
  final Gender gender;
  final UserStatus status;
  const UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.contactNumber,
    this.imageUrl,
    this.address,
    this.gender,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String id,
    String email,
    String password,
    String name,
    String contactNumber,
    String imageUrl,
    List<AddressModel> address,
    Gender gender,
    UserStatus status,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      contactNumber: contactNumber ?? this.contactNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      email,
      password,
      name,
      contactNumber,
      imageUrl,
      address,
      gender,
      status,
    ];
  }
}
