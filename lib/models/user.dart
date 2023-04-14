class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePhoto: map['profile_photo'] as String?,
      phoneNumber: map['phone_number'] as String?,
    );
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: 'Kelompok_4',
      username: 'tim4',
      email: 'timfour@mail.com',
      profilePhoto:
          'https://production.listennotes.com/podcasts/kelompok-4-dIpLGg96M_U-sXnJSNM1B8A.1400x1400.jpg',
      phoneNumber: '085123456789',
    );
  }
}
