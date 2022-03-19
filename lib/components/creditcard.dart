import 'package:auto_size_text/auto_size_text.dart';
import 'package:expense_manager/models/creditcard_model.dart';
import 'package:expense_manager/providers/theme_provider.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatelessWidget {
  final CreditCardModel info;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;

  const CreditCard(
      {required this.info,
      Key? key,
      this.height = 200,
      this.width = 100,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(AppTheme.spacing1),
      decoration: BoxDecoration(
          color: context.select<ThemeProvider, ThemeMode>(
                      (theme) => theme.themeMode) ==
                  ThemeMode.light
              ? Colors.white
              : const Color.fromARGB(255, 55, 54, 54),
          borderRadius:
              BorderRadius.all(Radius.circular(AppTheme.borderRadius2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CreditCardIcon(
                size: 80,
              ),
              CreditCardBalance(info: info)
            ],
          ),
          const Spacer(),
          Text(
            info.name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: AppTheme.spacing1,
          ),
          CardNumber(
            info: info,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  wordSpacing: 2,
                ),
          )
        ],
      ),
    );
  }
}

class CardNumber extends StatelessWidget {
  const CardNumber({Key? key, required this.info, this.style})
      : super(key: key);

  final CreditCardModel info;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildChild(),
    );
  }

  List<Widget> _buildChild() {
    List<String> nums = info.number.split('');
    List<Widget> widgets = [];
    for (int i = 0; i < nums.length; i++) {
      if (i > 3 && i < nums.length - 4) {
        widgets.add(Text(
          '*',
          style: style,
          textAlign: TextAlign.center,
        ));
      } else {
        widgets.add(Text(
          nums[i],
          style: style,
          textAlign: TextAlign.center,
        ));
      }
    }
    return widgets;
  }
}

class CreditCardBalance extends StatelessWidget {
  const CreditCardBalance({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CreditCardModel info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          info.balance,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w500,
                color: context.select<ThemeProvider, ThemeMode>(
                            (theme) => theme.themeMode) ==
                        ThemeMode.dark
                    ? Colors.white
                    : Theme.of(context).textTheme.headline4!.color,
              ),
          maxLines: 1,
        ),
        Transform.translate(
          offset: const Offset(0, 15),
          child: Text(info.curency.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium),
        )
      ],
    );
  }
}

class CreditCardIcon extends StatelessWidget {
  final double size;
  const CreditCardIcon({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Stack(
        children: [
          Container(
            height: size / 2,
            width: size / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 4),
              color: Colors.red.withOpacity(0.8),
            ),
          ),
          Positioned(
              left: size / 4,
              child: Container(
                height: size / 2,
                width: size / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size / 4),
                  color: Colors.orange.withOpacity(0.8),
                ),
              ))
        ],
      ),
    );
  }
}
