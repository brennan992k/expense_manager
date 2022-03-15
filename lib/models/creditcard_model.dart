import 'dart:convert';

class CreditCardModel {
  final String id;
  final String balance;
  final String name;
  final String bank;
  final String number;
  final String curency;

  final int available;

  CreditCardModel({
    required this.id,
    required this.balance,
    required this.name,
    required this.bank,
    required this.number,
    required this.curency,
    required this.available,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'balance': balance,
      'name': name,
      'bank': bank,
      'number': number,
      'curency': curency,
      'available': available,
    };
  }

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      id: map['id'] ?? '',
      balance: map['balance'] ?? '',
      name: map['name'] ?? '',
      bank: map['bank'] ?? '',
      number: map['number'] ?? '',
      curency: map['curency'] ?? '',
      available: map['available'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCardModel.fromJson(String source) =>
      CreditCardModel.fromMap(json.decode(source));
}
