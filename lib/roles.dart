/*class UserRole {
  String? email;
  String? wrool;

// receiving data
  UserRole({this.email, this.wrool});
  factory UserRole.fromMap(map) {
    return UserRole(
      email: map['email'],
      wrool: map['wrool'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'wrool': wrool,
    };
  }
}*/

class UserRole {
  String? email;
  String? role;
  String? uid;
  String? name;
  String? phNo;

// receiving data
  UserRole({this.uid, this.email, this.role, this.name, this.phNo});
  factory UserRole.fromMap(map) {
    return UserRole(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'],
      phNo: map['phNo']
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'name': name,
      'phNo': phNo
    };
  }
}