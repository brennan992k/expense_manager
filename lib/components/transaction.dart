import 'package:expense_manager/models/transaction_model.dart';
import 'package:expense_manager/providers/theme_provider.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key, required this.info, this.margin})
      : super(key: key);
  final TranscationModel info;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: context.select<ThemeProvider, ThemeMode>(
                      (theme) => theme.themeMode) ==
                  ThemeMode.light
              ? Colors.white
              : const Color.fromARGB(255, 55, 54, 54),
          borderRadius:
              BorderRadius.all(Radius.circular(AppTheme.borderRadius2))),
      padding: EdgeInsets.all(AppTheme.spacing2),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                info.type == '-' ? Icons.arrow_downward : Icons.arrow_upward,
                size: Theme.of(context).iconTheme.size,
                color: info.type == '-' ? Colors.red : Colors.green,
              ),
              SizedBox(
                width: AppTheme.spacing2,
              ),
              Text(
                info.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                info.price,
              ),
              Transform.translate(
                offset: const Offset(0, 5),
                child: Text(
                  info.currency,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 8),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
