import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

class SeatCatigo extends StatefulWidget {
  const new({super.key});

  @override
  State<SeatCatigo> createState() => _SeatCatigoState();
}

class _SeatCatigoState extends State<SeatCatigo> {
  String selectedChairType = 'S Chair (I)';

  final List<String> chairTypes = ['S Chair (A)', 'S Chair (E)', 'S Chair (I)'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: Row(
        spacing: 20,
        children: List.generate(chairTypes.length, (index) {
          final type = chairTypes[index];
          final isSelected = selectedChairType == type;
          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                setState(() {
                  selectedChairType = type;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? ColorsApp.selectedColor : Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  type,
                  style: Fontstyle.openSansRegular14(
                    context,
                  ).copyWith(color: isSelected ? Colors.white : Colors.black87),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
