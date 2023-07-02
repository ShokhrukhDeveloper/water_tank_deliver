class Token {
  Token({
       this.accessToken,
       this.refreshToken,
       this.expired,});

  Token.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expired = json['expired'];
  }
  String? accessToken;
  String? refreshToken;
  String? expired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['expired'] = expired;
    return map;
  }

}