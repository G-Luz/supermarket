import 'package:json_annotation/json_annotation.dart';
import 'package:supermarket_app/app/modules/bag/domain/bag.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String role;
  String? password;
  Bag? bag;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.password,
    this.bag,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
