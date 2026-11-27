import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class DropDownWidget extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?> onChanged;
  final IconData leadingIcon;

  const DropDownWidget({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      style: const TextStyle(
        color: Colors.black, // لون النص المختار
        fontSize: 16,
      ),

      decoration: InputDecoration(
        prefixIcon: Icon(leadingIcon, color: Color(ColorsApp.appBarColor)),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

        hintText: 'Select Item',
      ),

      dropdownColor: Colors.white,

      items: items.map((item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),

      onChanged: onChanged,
    );
  }
}
