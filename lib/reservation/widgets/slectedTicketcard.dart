import 'package:flutter/material.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';

class Slectedticketcard extends StatelessWidget {
  final TicketModel ticket;

  const Slectedticketcard({super.key, required this.ticket});

  static const Color mainColor = Color(0xFF075967);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
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
                    ),
                    _station(
                      ticket.toCode,
                      ticket.toCity,
                      CrossAxisAlignment.end,
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
                    _time(
                      ticket.departureTime,
                      ticket.departureDate,
                      CrossAxisAlignment.start,
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

                    _time(
                      ticket.arrivalTime,
                      ticket.arrivalDate,
                      CrossAxisAlignment.end,
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Text(
                  'Duration ${ticket.duration}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _station(String code, String city, CrossAxisAlignment alignment) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          code,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF18202E),
          ),
        ),
        const SizedBox(height: 5),
        Text(city, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
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
