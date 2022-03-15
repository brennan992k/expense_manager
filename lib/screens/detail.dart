import 'package:expense_manager/components/creditcard.dart';
import 'package:expense_manager/models/creditcard_model.dart';
import 'package:expense_manager/providers/creditcard_provider.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.info}) : super(key: key);
  final CreditCardModel info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          info.name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context
                    .read<CreditCardProvider>()
                    .removeCreditCard(info.number);
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(AppTheme.spacing1),
          child: Column(
            children: [
              CreditCard(
                margin: EdgeInsets.only(
                    left: AppTheme.spacing2, right: AppTheme.spacing2),
                width: MediaQuery.of(context).size.width - AppTheme.spacing1 * 2,
                info: info,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
