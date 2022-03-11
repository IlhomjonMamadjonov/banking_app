import 'dart:convert';

ModelCard CardFromJson(String str) => ModelCard.fromJson(json.decode(str));

String CardToJson(ModelCard data) => json.encode(data.toJson());

class ModelCard {
  ModelCard({
    required this.expiryDate,
    required this.holderName,
    required this.cvvCode,
    required this.cardNumber,
    this.id,
  });

  String expiryDate;
  String holderName;
  String cvvCode;
  String cardNumber;
  String? id;

  factory ModelCard.fromJson(Map<String, dynamic> json) => ModelCard(
    expiryDate: json["expiryDate"],
    holderName: json["holderName"],
    cvvCode: json["cvvCode"],
    cardNumber: json["cardNumber"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "expiryDate": expiryDate,
    "holderName": holderName,
    "cvvCode": cvvCode,
    "cardNumber": cardNumber,
    "id": id,
  };
}
