import 'dart:convert';

class TranscationModel {
  final String? id;
  final String name;
  final String price;
  final String type;
  final String currency;

  TranscationModel({
    this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'type': type,
      'currency': currency,
    };
  }

  factory TranscationModel.fromMap(Map<String, dynamic> map) {
    return TranscationModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      type: map['type'] ?? '',
      currency: map['currency'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TranscationModel.fromJson(String source) =>
      TranscationModel.fromMap(json.decode(source));
}
