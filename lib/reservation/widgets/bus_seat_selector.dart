import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

enum SeatStatus { available, selected, booked }

class BusSeatSelector extends StatefulWidget {
  const BusSeatSelector({super.key});

  @override
  State<BusSeatSelector> createState() => _BusSeatSelectorState();
}

class _BusSeatSelectorState extends State<BusSeatSelector> {
  final Color availableColor = const Color(0xFFF1F4FC);
  final Color selectedColor = const Color(0xFF00616D);

  // Booked seat colors
  final Color bookedColor = const Color(0xFFE5E7EB);
  final Color bookedTextColor = const Color(0xFF6B7280);

  final List<String> rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  final Map<String, SeatStatus> seats = {
    'A2': SeatStatus.booked,
    'B2': SeatStatus.booked,
    'B3': SeatStatus.booked,
    'C1': SeatStatus.selected,
    'C2': SeatStatus.selected,
    'C4': SeatStatus.booked,
    'D3': SeatStatus.booked,
    'E3': SeatStatus.booked,
  };

  void selectSeat(String seat) {
    setState(() {
      final currentStatus = seats[seat] ?? SeatStatus.available;

      if (currentStatus == SeatStatus.booked) return;

      if (currentStatus == SeatStatus.selected) {
        seats[seat] = SeatStatus.available;
      } else {
        seats[seat] = SeatStatus.selected;
      }
    });
  }

  Color getSeatColor(SeatStatus status) {
    switch (status) {
      case SeatStatus.available:
        return availableColor;
      case SeatStatus.selected:
        return selectedColor;
      case SeatStatus.booked:
        return bookedColor;
    }
  }

  Widget buildSeat(String seat, double fontSize) {
    final status = seats[seat] ?? SeatStatus.available;

    final l10n = AppLocalizations.of(context)!;

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: status == SeatStatus.booked ? null : () => selectSeat(seat),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: getSeatColor(status),
                borderRadius: BorderRadius.circular(10),
                border: status == SeatStatus.booked
                    ? Border.all(color: const Color(0xFFD1D5DB), width: 1)
                    : null,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  status == SeatStatus.booked ? l10n.booked : seat,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: status == SeatStatus.booked
                        ? fontSize - 2
                        : responsivesize(context, fontsize: fontSize),
                    color: status == SeatStatus.selected
                        ? Colors.white
                        : status == SeatStatus.booked
                        ? bookedTextColor
                        : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSeatRow(String row, double fontSize) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            buildSeat('${row}1', fontSize),
            buildSeat('${row}2', fontSize),

            // Aisle between seats
            SizedBox(width: constraints.maxWidth * 0.08),

            buildSeat('${row}3', fontSize),
            buildSeat('${row}4', fontSize),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final fontSize = width < 350 ? 11.0 : 14.0;

        return Center(
          child: SizedBox(
            width: width * 0.90,

            child: AspectRatio(
              // عدّل النسبة حسب أبعاد صورة الأتوبيس
              aspectRatio: 0.5,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Bus frame
                    Image.asset(
                      'assets/images/bus_seats_bg.png',
                      fit: BoxFit.fill,
                    ),

                    // Seats area
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: width * 0.5,
                          bottom: width * 0.15,
                          left: width * 0.12,
                          right: width * 0.14,
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: rows.map((row) {
                            return buildSeatRow(row, fontSize);
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
