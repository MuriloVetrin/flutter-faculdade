import 'package:flutter_hackathon/helpers/extensions.dart';

class Login {
  int id;
  String ra;

  Login({
    required this.id,
    required this.ra,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"].toString().toInt(),
        ra: json["ra"].toString(),
      );
}
