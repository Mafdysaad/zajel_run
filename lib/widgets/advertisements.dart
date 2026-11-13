import 'package:flutter/material.dart';
import 'package:zajel_run/widgets/custom_News_card.dart';

class Advertisements extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomNewsCard(
                image: const AssetImage('assets/images/1.png'),
                title: 'Sundarban Express: Travel, Safety, and Experience',
                author: 'Shafiq Khan',
                date: '21 Aug, 2025',
              ),
            ),
          );
        },
      ),
    );
  }
}
