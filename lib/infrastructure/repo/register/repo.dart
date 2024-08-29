class UserRegisterRepo {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String dob;
  final String profileFor;
  final String relationshipStatus;
  final List<String> images;
  final List<String> interests;
  final Job job;
  final Education education;
  final String password;
  final String country;
  final String state;
  final String city;
  final double latitude;
  final double longitude;
  final String religion;
  final String caste;

  UserRegisterRepo({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.profileFor,
    required this.relationshipStatus,
    required this.images,
    required this.interests,
    required this.job,
    required this.education,
    required this.password,
    required this.country,
    required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.religion,
    required this.caste,
  });
}

class Job {
  final String title;
  final String company;
  final String place;

  Job({
    required this.title,
    required this.company,
    required this.place,
  });
}

class Education {
  final String qualification;
  final String university;
  final String place;

  Education({
    required this.qualification,
    required this.university,
    required this.place,
  });
}
