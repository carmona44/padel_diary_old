import 'dart:convert';

Ball ballFromJson(String str) => Ball.fromJson(json.decode(str));

String ballToJson(Ball data) => json.encode(data.toJson());

class Ball {
  Ball({
    this.ballId,
    this.brand,
    this.model,
  });

  int ballId;
  String brand;
  String model;

  factory Ball.fromJson(Map<String, dynamic> json) => Ball(
        ballId: json["ball_id"],
        brand: json["brand"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "ball_id": ballId,
        "brand": brand,
        "model": model,
      };
}
