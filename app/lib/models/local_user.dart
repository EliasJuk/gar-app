enum UserRole {
  admin,
  volunteer,
}

class LocalUser {
  final String name;
  final UserRole role;

  const LocalUser({
    required this.name,
    required this.role,
  });

  bool get isAdmin => role == UserRole.admin;
}