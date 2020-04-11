class UserAuth {
  final String userName;
  final String password;
  final DateTime created;
  final DateTime expiration;
  final String accessToken;

  UserAuth(this.userName, this.password, this.created, this.expiration,
      this.accessToken);
}
