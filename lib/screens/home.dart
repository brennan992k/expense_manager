import 'package:expense_manager/components/creditcard_list.dart';
import 'package:expense_manager/components/transaction_list.dart';
import 'package:expense_manager/route.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Home',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoute.addRoute),
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).iconTheme.color,
                  size: Theme.of(context).iconTheme.size,
                ))
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: const [CreditCardList(), TransactionList()]),
        ),
      ),
    );
  }
}
