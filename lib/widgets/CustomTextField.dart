import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final IconData icon;
  final TextInputType? keyboardtype;

  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.keyboardtype,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController controller;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: widget.keyboardtype,
        decoration: InputDecoration(
          labelText: widget.title,
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
        ),
      ),
    );
  }
}
