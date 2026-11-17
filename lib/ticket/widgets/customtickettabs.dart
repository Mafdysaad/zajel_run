import 'package:flutter/material.dart';

class CustomTicketTabs extends StatefulWidget {
  final Function(int index) onTabChanged;

  const CustomTicketTabs({super.key, required this.onTabChanged});

  @override
  State<CustomTicketTabs> createState() => _CustomTicketTabsState();
}

class _CustomTicketTabsState extends State<CustomTicketTabs> {
  int selectedIndex = 0;

  final List<String> tabs = ['Ongoing', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex == index;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              widget.onTabChanged(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontSize: 20,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  height: 3,
                  width: double.infinity,
                  color: isSelected ? Colors.white : Colors.transparent,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
