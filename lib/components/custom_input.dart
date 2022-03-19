import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String placeholder;
  final String? initialValue;
  double? width;
  double? height;
  final String? Function(String?)? validator;
  final bool autofocus;
  void Function(String?)? onEditingComplete;
  void Function(TextEditingController)? controller;

  CustomInput(
      {Key? key,
      this.placeholder = '',
      this.initialValue,
      this.validator,
      this.width,
      this.height,
      this.autofocus = false,
      this.controller,
      this.onEditingComplete})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;

  _nextInput() {
    if (widget.validator != null &&
        widget.validator!(_controller.text) == null) {
      _focusNode.nextFocus();
    }
    if (widget.onEditingComplete != null) {
      widget.onEditingComplete!(_controller.text);
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();

    if (widget.controller != null) {
      widget.controller!(_controller);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      onEditingComplete: _nextInput,
      focusNode: _focusNode,
      controller: _controller,
      validator: widget.validator,
      initialValue: widget.initialValue,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.placeholder,
      ),
    );
  }
}
