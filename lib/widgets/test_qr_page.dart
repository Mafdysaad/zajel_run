import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TestQrPage extends StatelessWidget {
  const TestQrPage({super.key});

  final String bookingData = '''
  {
    "bookingId": "TEST_123",
    "passengerName": "Ahmed Mohamed",
    "tripId": "TRIP_001",
    "seatNumber": "A5",
    "status": "confirmed"
  }
  ''';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: bookingData,
            version: QrVersions.auto,
            size: 230,
            backgroundColor: Colors.white,
          ),

          const SizedBox(height: 20),

          const Text(
            'Booking Confirmed',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          const Text('Passenger: Ahmed Mohamed'),
          const Text('Seat: A5'),
          const Text('Trip: TRIP_001'),
        ],
      ),
    );
  }
}
