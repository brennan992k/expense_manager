import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  void Function()? onPressed;
  double? width;
  double? height;
  CustomButton(
      {Key? key, required this.child, this.onPressed, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(AppTheme.spacing1),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppTheme.borderRadius2)),
        ),
        child: child,
      ),
    );
  }
}
