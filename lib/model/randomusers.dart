// class RandomUsersModel {
//   final int status;
//   final String message;
//   final List<UserRandomUsersModel> users;

//   RandomUsersModel({
//     required this.status,
//     required this.message,
//     required this.users,
//   });

//   factory RandomUsersModel.fromJson(Map<String, dynamic> json) {
//     return RandomUsersModel(
//       status: json['status'] as int,
//       message: json['message'] as String,
//       users: List<UserRandomUsersModel>.from(
//           json['users'].map((user) => UserRandomUsersModel.fromJson(user))),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'users': users.map((user) => user.toJson()).toList(),
//     };
//   }
// }

// // class UserRandomUsersModel {
// //   final String id;
// //   final String firstName;
// //   final String lastName;
// //   final String gender;
// //   final String dob;
// //   final int age;
// //   final String bio;
// //   final List<String> interests;
// //   final String profilePic;
// //   final String country;
// //   final String state;
// //   final String city;
// //   final double latitude;
// //   final double longitude;
// //   final String relationshipStatus;
// //   final String profileFor;
// //   final String religion;
// //   final String caste;
// //   final JobRandomUsersModel job;
// //   final EducationRandomUsersModel education;

// //   UserRandomUsersModel({
// //     required this.id,
// //     required this.firstName,
// //     required this.lastName,
// //     required this.gender,
// //     required this.dob,
// //     required this.age,
// //     required this.bio,
// //     required this.interests,
// //     required this.profilePic,
// //     required this.country,
// //     required this.state,
// //     required this.city,
// //     required this.latitude,
// //     required this.longitude,
// //     required this.relationshipStatus,
// //     required this.profileFor,
// //     required this.religion,
// //     required this.caste,
// //     required this.job,
// //     required this.education,
// //   });

// //   factory UserRandomUsersModel.fromJson(Map<String, dynamic> json) {
// //     return UserRandomUsersModel(
// //       id: json['_id'] as String,
// //       firstName: json['first_name'] as String,
// //       lastName: json['last_name'] as String,
// //       gender: json['gender'] as String,
// //       dob: json['dob'] as String,
// //       age: json['age'] as int,
// //       bio: json['bio'] as String,
// //       interests: List<String>.from(json['interests'] as List),
// //       profilePic: json['profile_pic'] as String,
// //       country: json['country'] as String,
// //       state: json['state'] as String,
// //       city: json['city'] as String,
// //       latitude: (json['latitude'] as num).toDouble(),
// //       longitude: (json['longitude'] as num).toDouble(),
// //       relationshipStatus: json['relationship_status'] as String,
// //       profileFor: json['profile_for'] as String,
// //       religion: json['religion'] as String,
// //       caste: json['caste'] as String,
// //       job: JobRandomUsersModel.fromJson(json['job']),
// //       education: EducationRandomUsersModel.fromJson(json['education']),
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       '_id': id,
// //       'first_name': firstName,
// //       'last_name': lastName,
// //       'gender': gender,
// //       'dob': dob,
// //       'age': age,
// //       'bio': bio,
// //       'interests': interests,
// //       'profile_pic': profilePic,
// //       'country': country,
// //       'state': state,
// //       'city': city,
// //       'latitude': latitude,
// //       'longitude': longitude,
// //       'relationship_status': relationshipStatus,
// //       'profile_for': profileFor,
// //       'religion': religion,
// //       'caste': caste,
// //       'job': job.toJson(),
// //       'education': education.toJson(),
// //     };
// //   }
// // }
// class UserRandomUsersModel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String gender;
//   final String dob;
//   final int? age; // Make age nullable
//   final String bio;
//   final List<String> interests;
//   final String profilePic;
//   final String country;
//   final String state;
//   final String city;
//   final double latitude;
//   final double longitude;
//   final String relationshipStatus;
//   final String profileFor;
//   final String religion;
//   final String caste;
//   final JobRandomUsersModel job;
//   final EducationRandomUsersModel education;

//   UserRandomUsersModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.gender,
//     required this.dob,
//     this.age, // Handle nullable age
//     required this.bio,
//     required this.interests,
//     required this.profilePic,
//     required this.country,
//     required this.state,
//     required this.city,
//     required this.latitude,
//     required this.longitude,
//     required this.relationshipStatus,
//     required this.profileFor,
//     required this.religion,
//     required this.caste,
//     required this.job,
//     required this.education,
//   });

//   factory UserRandomUsersModel.fromJson(Map<String, dynamic> json) {
//     return UserRandomUsersModel(
//       id: json['_id'] as String,
//       firstName: json['first_name'] as String,
//       lastName: json['last_name'] as String,
//       gender: json['gender'] as String,
//       dob: json['dob'] as String,
//       age: json['age'] != null ? json['age'] as int : null, // Check for null
//       bio: json['bio'] as String,
//       interests: List<String>.from(json['interests'] as List),
//       profilePic: json['profile_pic'] as String,
//       country: json['country'] as String,
//       state: json['state'] as String,
//       city: json['city'] as String,
//       latitude: (json['latitude'] as num).toDouble(),
//       longitude: (json['longitude'] as num).toDouble(),
//       relationshipStatus: json['relationship_status'] as String,
//       profileFor: json['profile_for'] as String,
//       religion: json['religion'] as String,
//       caste: json['caste'] as String,
//       job: JobRandomUsersModel.fromJson(json['job']),
//       education: EducationRandomUsersModel.fromJson(json['education']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'gender': gender,
//       'dob': dob,
//       'age': age, // Include the nullable age
//       'bio': bio,
//       'interests': interests,
//       'profile_pic': profilePic,
//       'country': country,
//       'state': state,
//       'city': city,
//       'latitude': latitude,
//       'longitude': longitude,
//       'relationship_status': relationshipStatus,
//       'profile_for': profileFor,
//       'religion': religion,
//       'caste': caste,
//       'job': job.toJson(),
//       'education': education.toJson(),
//     };
//   }
// }

// class JobRandomUsersModel {
//   final String title;
//   final String company;
//   final String place;

//   JobRandomUsersModel({
//     required this.title,
//     required this.company,
//     required this.place,
//   });

//   factory JobRandomUsersModel.fromJson(Map<String, dynamic> json) {
//     return JobRandomUsersModel(
//       title: json['title'] as String,
//       company: json['company'] as String,
//       place: json['place'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'company': company,
//       'place': place,
//     };
//   }
// }

// class EducationRandomUsersModel {
//   final String qualification;
//   final String university;
//   final String place;

//   EducationRandomUsersModel({
//     required this.qualification,
//     required this.university,
//     required this.place,
//   });

//   factory EducationRandomUsersModel.fromJson(Map<String, dynamic> json) {
//     return EducationRandomUsersModel(
//       qualification: json['qualification'] as String,
//       university: json['university'] as String,
//       place: json['place'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'qualification': qualification,
//       'university': university,
//       'place': place,
//     };
//   }
// }
class RandomUsersModel {
  final int? status;
  final String? message;
  final List<UserRandomUsersModel>? users;

  RandomUsersModel({
    this.status,
    this.message,
    this.users,
  });

  factory RandomUsersModel.fromJson(Map<String, dynamic> json) {
    return RandomUsersModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      users: json['users'] != null
          ? List<UserRandomUsersModel>.from(
              json['users'].map((user) => UserRandomUsersModel.fromJson(user)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'users': users?.map((user) => user.toJson()).toList(),
    };
  }
}

class UserRandomUsersModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? dob;
  final int? age;
  final String? bio;
  final List<String>? interests;
  final String? profilePic;
  final String? country;
  final String? state;
  final String? city;
  final double? latitude;
  final double? longitude;
  final String? relationshipStatus;
  final String? profileFor;
  final String? religion;
  final String? caste;
  final JobRandomUsersModel? job;
  final EducationRandomUsersModel? education;

  UserRandomUsersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.age,
    this.bio,
    this.interests,
    this.profilePic,
    this.country,
    this.state,
    this.city,
    this.latitude,
    this.longitude,
    this.relationshipStatus,
    this.profileFor,
    this.religion,
    this.caste,
    this.job,
    this.education,
  });

  factory UserRandomUsersModel.fromJson(Map<String, dynamic> json) {
    return UserRandomUsersModel(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      age: json['age'] as int?,
      bio: json['bio'] as String?,
      interests: json['interests'] != null
          ? List<String>.from(json['interests'])
          : null,
      profilePic: json['profile_pic'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      relationshipStatus: json['relationship_status'] as String?,
      profileFor: json['profile_for'] as String?,
      religion: json['religion'] as String?,
      caste: json['caste'] as String?,
      job: json['job'] != null
          ? JobRandomUsersModel.fromJson(json['job'])
          : null,
      education: json['education'] != null
          ? EducationRandomUsersModel.fromJson(json['education'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'dob': dob,
      'age': age,
      'bio': bio,
      'interests': interests,
      'profile_pic': profilePic,
      'country': country,
      'state': state,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'relationship_status': relationshipStatus,
      'profile_for': profileFor,
      'religion': religion,
      'caste': caste,
      'job': job?.toJson(),
      'education': education?.toJson(),
    };
  }
}

class JobRandomUsersModel {
  final String? title;
  final String? company;
  final String? place;

  JobRandomUsersModel({
    this.title,
    this.company,
    this.place,
  });

  factory JobRandomUsersModel.fromJson(Map<String, dynamic> json) {
    return JobRandomUsersModel(
      title: json['title'] as String?,
      company: json['company'] as String?,
      place: json['place'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company': company,
      'place': place,
    };
  }
}

class EducationRandomUsersModel {
  final String? qualification;
  final String? university;
  final String? place;

  EducationRandomUsersModel({
    this.qualification,
    this.university,
    this.place,
  });

  factory EducationRandomUsersModel.fromJson(Map<String, dynamic> json) {
    return EducationRandomUsersModel(
      qualification: json['qualification'] as String?,
      university: json['university'] as String?,
      place: json['place'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qualification': qualification,
      'university': university,
      'place': place,
    };
  }
}
