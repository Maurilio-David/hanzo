import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    this.obscure = false,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure && !showPassword,
        decoration: InputDecoration(
          suffixIcon: widget.obscure
              ? IconButton(
                  icon: showPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
              : null,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
