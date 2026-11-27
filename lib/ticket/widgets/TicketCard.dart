import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';

class TicketCard extends StatelessWidget {
  final TicketModel ticket;

  const TicketCard({super.key, required this.ticket});

  static const Color mainColor = Color(0xFF075967);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    ticket.companyName,
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Color(0xFF18202E)),
                  ),
                ),
                Text(
                  '${ticket.seatClass} | ${ticket.seatNumber}',
                  style: Fontstyle.openSansRegular14(context)
                      .copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.shade200),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                // Stations
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _station(
                      ticket.fromCode,
                      ticket.fromCity,
                      CrossAxisAlignment.start,
                      context,
                    ),
                    _station(
                      ticket.toCode,
                      ticket.toCity,
                      CrossAxisAlignment.end,
                      context,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Dotted line
                Row(
                  children: List.generate(
                    30,
                    (index) => Expanded(
                      child: Container(
                        height: 1.5,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Times and Bus Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: _time(
                        ticket.departureTime,
                        ticket.departureDate,
                        CrossAxisAlignment.start,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAF1F2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.directions_bus_outlined,
                        color: mainColor,
                        size: 23,
                      ),
                    ),

                    Flexible(
                      child: _time(
                        ticket.arrivalTime,
                        ticket.arrivalDate,
                        CrossAxisAlignment.end,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Text(
                  "${l10n.duration} "
                  " ${ticket.duration}",
                  style: Fontstyle.openSansRegular14(context)
                      .copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _station(
    String code,
    String city,
    CrossAxisAlignment alignment,
    context,
  ) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          code,
          style: Fontstyle.openSansBold18(context)
              .copyWith(color: Color(0xFF18202E)),
        ),
        const SizedBox(height: 5),
        Text(
          city,
          style: Fontstyle.openSansRegular14(context)
              .copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _time(String time, String date, CrossAxisAlignment alignment) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF18202E),
          ),
        ),
        const SizedBox(height: 5),
        Text(date, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
      ],
    );
  }
}
