class user {
  int id;
  String username;
  String phone;
  String password;
  String email;
  String nickname;

  user({this.username,this.nickname,this.email, this.phone,this.password});

  user.fromMap(Map<String, dynamic> map) {
    this.username = map['username'];
    this.nickname = map['nickname'];
    this.email = map['email'];
    this.phone = map['phone'];
    this.password = map['password'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['username'] = this.username;
    map['nickname'] = this.nickname;
    map['email'] = this.email;
    map['phone'] = this.phone;
    map['password'] = this.password;
    return map;
  }
}