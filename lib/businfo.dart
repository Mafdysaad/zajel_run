import 'package:flutter/material.dart';
import 'package:zajel_run/widgets/businfoitem.dart';
import 'package:zajel_run/widgets/header.dart';
import 'package:zajel_run/widgets/searchforbus.dart';

class BusInfo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          spacing: 20,
          children: [
            Header(title: 'Bus Info', onPressed: () {}),
            SizedBox(height: 10),
            Searchforbus(),
            Businfoitem(title: "Al Nardine", onTap: () {}),
            Businfoitem(title: "Al Nardine", onTap: () {}),
            Businfoitem(title: "Al Nardine", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
