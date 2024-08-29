class MatchesFetchModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String dob;
  final int age;
  final String bio;
  final List<String> interests;
  final String role;
  final String profilePic;
  final String country;
  final String state;
  final String city;
  final double latitude;
  final double longitude;
  final String religion;
  final String caste;
  final bool blocked;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  MatchesFetchModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.age,
    required this.bio,
    required this.interests,
    required this.role,
    required this.profilePic,
    required this.country,
    required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.religion,
    required this.caste,
    required this.blocked,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MatchesFetchModel.fromJson(Map<String, dynamic> json) {
    return MatchesFetchModel(
      id: json['_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      age: json['age'] as int,
      bio: json['bio'] as String,
      interests: List<String>.from(json['interests'] as List),
      role: json['role'] as String,
      profilePic: json['profile_pic'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      religion: json['religion'] as String,
      caste: json['caste'] as String,
      blocked: json['blocked'] as bool,
      isVerified: json['is_verified'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'age': age,
      'bio': bio,
      'interests': interests,
      'role': role,
      'profile_pic': profilePic,
      'country': country,
      'state': state,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'religion': religion,
      'caste': caste,
      'blocked': blocked,
      'is_verified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
