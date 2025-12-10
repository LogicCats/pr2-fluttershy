import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final IconData prefixIcon;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    required this.focusNode,
    this.nextFocusNode,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _obscureText,
      textInputAction: widget.nextFocusNode != null
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (widget.nextFocusNode != null) {
          widget.nextFocusNode!.requestFocus();
        }
      },
      validator: widget.validator ?? _defaultValidator,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Theme.of(context).hintColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }
    return null;
  }
}