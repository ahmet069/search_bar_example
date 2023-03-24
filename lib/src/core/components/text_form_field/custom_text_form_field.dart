import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.isReadOnly,
    this.onChanged,
    this.onTap,
  });

  final bool isReadOnly;
  final void Function()? onTap;
  final void Function(String input)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      enableSuggestions: false,
      readOnly: isReadOnly,
      style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        suffixIcon: const Icon(Icons.search),
        hintText: 'ARA',
        hintStyle: const TextStyle(fontSize: 13),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        helperStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
        errorStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}
