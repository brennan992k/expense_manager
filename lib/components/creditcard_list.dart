import 'package:expense_manager/components/creditcard.dart';
import 'package:expense_manager/models/creditcard_model.dart';
import 'package:expense_manager/providers/creditcard_provider.dart';
import 'package:expense_manager/route.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCardList extends StatelessWidget {
  const CreditCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CreditCardModel> creditcards =
        context.watch<CreditCardProvider>().creditcards;

    if (creditcards.isEmpty) {
      return SizedBox(
          height: 200,
          child: Center(
            child: Text(
              'Empty',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ));
    }

    if (creditcards.length == 1) {
      return SizedBox(
          height: 200,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.detailRoute,
                  arguments: creditcards.elementAt(0));
            },
            child: CreditCard(
                width:
                    MediaQuery.of(context).size.width - AppTheme.spacing1 * 2,
                info: creditcards.elementAt(0)),
          ));
    }
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: creditcards.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.detailRoute,
                      arguments: creditcards.elementAt(index));
                },
                child: CreditCard(
                    margin: EdgeInsets.only(
                        left:
                            index == 0 ? AppTheme.spacing1 : AppTheme.spacing2,
                        right: index == creditcards.length - 1
                            ? AppTheme.spacing1
                            : AppTheme.spacing2),
                    width: MediaQuery.of(context).size.width -
                        AppTheme.spacing1 * 3,
                    info: creditcards.elementAt(index)));
          }),
    );
  }
}
