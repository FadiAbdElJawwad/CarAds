import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final String? fcmToken;
  final String? role;
  final String? showroomName;
  final String? commercialRegister;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    this.fcmToken,
    this.role,
    this.showroomName,
    this.commercialRegister,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'],
      profileImage: data['profileImage'],
      fcmToken: data['fcmToken'],
      role: data['role'],
      showroomName: data['showroomName'],
      commercialRegister: data['commercialRegister'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'fcmToken': fcmToken,
      'role': role,
      'showroomName': showroomName,
      'commercialRegister': commercialRegister,
    };
  }
}
