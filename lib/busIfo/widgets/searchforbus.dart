import 'package:flutter/material.dart';

class Searchforbus extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearch;
  final String hintText;

  const Searchforbus({
    super.key,

    this.onChanged,
    this.onSearch,
    this.hintText = 'Search Bus',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
        prefixIcon: IconButton(
          onPressed: onSearch,
          icon: const Icon(Icons.search, color: Colors.white, size: 25),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 3, 105, 157),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 3, 105, 157)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 3, 105, 157)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 3, 105, 157)),
        ),
      ),
    );
  }
}
