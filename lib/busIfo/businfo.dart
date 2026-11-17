import 'package:flutter/material.dart';
import 'package:zajel_run/busIfo/widgets/businfoitem.dart';
import 'package:zajel_run/ticket/widgets/header.dart';
import 'package:zajel_run/busIfo/widgets/searchforbus.dart';

class BusInfo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        spacing: 20,
        children: [
          Header(title: 'Bus Info', onPressed: () {}),
          SizedBox(height: 10),
          Searchforbus(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Businfoitem(title: "Al Nardine", onTap: () {}),
                      Businfoitem(title: "Al Nardine", onTap: () {}),
                      Businfoitem(title: "Al Nardine", onTap: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
