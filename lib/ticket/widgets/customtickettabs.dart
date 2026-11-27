import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class CustomTicketTabs extends StatefulWidget {
  final Function(int index) onTabChanged;

  const CustomTicketTabs({super.key, required this.onTabChanged});

  @override
  State<CustomTicketTabs> createState() => _CustomTicketTabsState();
}

class _CustomTicketTabsState extends State<CustomTicketTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> tabs = [l10n.ongoing, l10n.completed, l10n.cancelled];
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
                    fontSize: responsivesize(context, fontsize: 20),
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
