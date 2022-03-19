import 'package:expense_manager/constants/shared_key.dart';
import 'package:expense_manager/models/creditcard_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditCardProvider extends ChangeNotifier {
  List<CreditCardModel> creditcards = [];

  CreditCardProvider();

  CreditCardModel? addCreditCard(
      {required CreditCardModel creditcard,
      Function(CreditCardModel creditcard)? onSuccess,
      Function()? onFailure}) {
    if (creditcards.any((i) => i.number == creditcard) && onFailure != null) {
      onFailure();
    } else {
      int beforeLength = creditcards.length;
      creditcards.add(creditcard);
      if (creditcards.length != beforeLength) {
        notifyListeners();
        _cache();
      }
      if (onSuccess != null) {
        onSuccess(creditcard);
      }
      return creditcard;
    }
  }

  removeCreditCard(String CreditCardNumber) {
    int beforeLength = creditcards.length;
    creditcards.removeWhere((i) => i.number == CreditCardNumber);
    if (creditcards.length != beforeLength) {
      notifyListeners();
      _cache();
    }
  }

  Future sync() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? rawCards = prefs.getStringList(cardList);
    if (rawCards != null) {
      var newcreditcards =
          rawCards.map((e) => CreditCardModel.fromJson(e)).toList();
      if (newcreditcards != creditcards) {
        creditcards = newcreditcards;
        notifyListeners();
      }
    }
  }

  Future<bool> _cache() async {
    List<String> rawCards = creditcards.map((e) => e.toJson()).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(cardList, rawCards);
  }
}
