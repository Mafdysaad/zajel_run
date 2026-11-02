import 'package:flutter/material.dart';
import 'package:zajel_run/customappbar.dart';
import 'package:zajel_run/widgets/routes_list.dart';
import 'package:zajel_run/widgets/search_field.dart';
import 'package:zajel_run/widgets/section_title.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Customappbar(),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background.jpeg',
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),

          // Bottom White Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Search Field
                    SearchField(),
                    // Section Title
                    SectionTitle(title: 'الخطوط المتاحة'),
                    // Routes List
                    RoutesList(),
                    SectionTitle(title: 'تاريخ الرحلة'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
