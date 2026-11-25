import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';

enum SeatStatus { available, selected, booked }

class BusSeatSelector extends StatefulWidget {
  const BusSeatSelector({super.key});

  @override
  State<BusSeatSelector> createState() => _BusSeatSelectorState();
}

class _BusSeatSelectorState extends State<BusSeatSelector> {
  final Color availableColor = const Color(0xFFF1F4FC);
  final Color selectedColor = const Color(0xFF00616D);
  final Color bookedColor = const Color(0xFFFF922E);

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
              ),
              child: Text(
                seat,
                style: TextStyle(
                  fontSize: responsivesize(context, fontsize: fontSize),
                  color: status == SeatStatus.selected
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.w500,
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 22),
            ...rows.map(
              (row) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: buildSeatRow(row, fontSize),
              ),
            ),
          ],
        );
      },
    );
  }
}
