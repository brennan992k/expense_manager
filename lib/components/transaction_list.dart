import 'package:expense_manager/components/transaction.dart';
import 'package:expense_manager/models/transaction_model.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.spacing1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppTheme.spacing1,
          ),
          const Text('Least transactions'),
          SizedBox(
            height: AppTheme.spacing1,
          ),
          Transaction(
              margin: EdgeInsets.only(bottom: AppTheme.spacing1),
              info: TranscationModel(
                  currency: 'USD', name: 'Shopping', price: '2000', type: '-')),
          Transaction(
              margin: EdgeInsets.only(bottom: AppTheme.spacing1),
              info: TranscationModel(
                  currency: 'USD', name: 'Salary', price: '3000', type: '+')),
          Transaction(
              margin: EdgeInsets.only(bottom: AppTheme.spacing1),
              info: TranscationModel(
                  currency: 'USD', name: 'Receive', price: '1000', type: '+'))
        ],
      ),
    );
  }
}
