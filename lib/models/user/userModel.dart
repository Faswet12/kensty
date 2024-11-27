import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    this.age,
    this.name,
    this.birthday,
    this.familyId,
    this.isAdmin,
    this.isFather,
    this.isPaid,
    this.isServant,
    this.isVerified,
    this.memberNumber,
    this.nameAr,
    this.password,
    this.phone,
    this.pin,
    this.services,
  });

  final int? age;
  final DateTime? birthday;
  final int? familyId;
  final bool? isAdmin;
  final bool? isFather;
  final bool? isPaid;
  final bool? isServant;
  final bool? isVerified;
  final int? memberNumber;
  final String? name;
  final String? nameAr;
  final String? password;
  final String? phone;
  final String? pin;
  final List<String>? services;

  factory User.fromFireStore(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? "",
      nameAr: json['nameAr'] ?? "",
      familyId: json['familyId'] != null ? json['familyId'] as int : null,
      age: json['age'] != null ? json['age'] as int : null,
      birthday: json['birthday'] != null
          ? (json['birthday'] as Timestamp).toDate()
          : null,
      isAdmin: json['isAdmin'] ?? false,
      isFather: json['isFather'] ?? false,
      isPaid: json['isPaid'] ?? false,
      isServant: json['isServant'] ?? false,
      isVerified: json['isVerified'] ?? false,
      memberNumber: json['memberNumber'] != null
          ? json['memberNumber'] as int
          : null,
      password: json['password'] ?? "",
      phone: json['phone'] ?? "",
      pin: json['pin'] ?? "",
      services: json['services'] != null
          ? List<String>.from(json['services'] as List)
          : null,
    );
  }
}