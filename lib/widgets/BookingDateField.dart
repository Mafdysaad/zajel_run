import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class BookingDateField extends StatefulWidget {
  const BookingDateField({super.key});

  @override
  State<BookingDateField> createState() => _BookingDateFieldState();
}

class _BookingDateFieldState extends State<BookingDateField> {
  DateTime selectedDate = DateTime.now();

  Future<void> showCalendar() async {
    final DateTime? date = await showDialog<DateTime>(
      context: context,
      builder: (dialogContext) {
        DateTime tempDate = selectedDate;

        return AlertDialog(
          contentPadding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: 350,
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.single,
              minDate: DateTime.now(),
              initialSelectedDate: selectedDate,
              selectionColor: Colors.orange,
              todayHighlightColor: Colors.deepOrange,
              onSelectionChanged: (args) {
                tempDate = args.value as DateTime;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext, tempDate);
              },
              child: const Text('تأكيد'),
            ),
          ],
        );
      },
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showCalendar,
      borderRadius: BorderRadius.circular(15),
      child: InputDecorator(
        decoration: InputDecoration(
          focusColor: Color(ColorsApp.normalDayColor),
          hintText: 'Departure Datr',
          prefixIcon: const Icon(
            Icons.calendar_month,
            color: Color(ColorsApp.appBarColor),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(
          MaterialLocalizations.of(context).formatMediumDate(selectedDate),
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
