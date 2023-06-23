import 'dart:convert';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String avatar;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.email,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? avatar,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, first_name: $firstName, last_name: $lastName, avatar: $avatar, email: $email)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return
      other.id == id &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.avatar == avatar &&
          other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    firstName.hashCode ^
    lastName.hashCode ^
    avatar.hashCode ^
    email.hashCode;
  }
}
