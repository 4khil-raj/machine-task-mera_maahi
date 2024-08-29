class UserFetchModel2 {
  int? status;
  String? message;
  UserModelFetch? user;

  UserFetchModel2({this.status, this.message, this.user});

  factory UserFetchModel2.fromJson(Map<String, dynamic> json) {
    return UserFetchModel2(
      status: json['status'] as int?,
      message: json['message'] as String?,
      user: json['user'] != null ? UserModelFetch.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user?.toJson(),
    };
  }
}

class UserModelFetch {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? gender;
  String? dob;
  int? age;
  String? bio;
  List<String>? interests;
  String? role;
  String? profilePic;
  String? country;
  String? state;
  String? city;
  double? latitude;
  double? longitude;
  String? religion;
  String? caste;
  bool? blocked;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  UserModelFetch({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
    this.dob,
    this.age,
    this.bio,
    this.interests,
    this.role,
    this.profilePic,
    this.country,
    this.state,
    this.city,
    this.latitude,
    this.longitude,
    this.religion,
    this.caste,
    this.blocked,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModelFetch.fromJson(Map<String, dynamic> json) {
    return UserModelFetch(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      age: json['age'] as int?,
      bio: json['bio'] as String?,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      role: json['role'] as String?,
      profilePic: json['profile_pic'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      religion: json['religion'] as String?,
      caste: json['caste'] as String?,
      blocked: json['blocked'] as bool?,
      isVerified: json['is_verified'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
