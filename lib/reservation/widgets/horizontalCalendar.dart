import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class HorizontalCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const HorizontalCalendar({super.key, required this.onDateSelected});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final today = DateTime.now();
    final List<String> days = [
      l10n.mon,
      l10n.tue,
      l10n.wed,
      l10n.thu,
      l10n.fri,
      l10n.sat,
      l10n.sun,
    ];

    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          final date = DateTime(today.year, today.month, today.day + index);

          final isSelected =
              date.year == selectedDate.year &&
              date.month == selectedDate.month &&
              date.day == selectedDate.day;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
              });

              widget.onDateSelected(date);
            },
            child: Container(
              width: 65,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff245966) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffEEEEEE)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[date.weekday - 1],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${date.day}',
                    style: Fontstyle.openSansBold20(
                      context,
                    ).copyWith(color: isSelected ? Colors.white : Colors.black),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
