import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/size_config.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/widgets/custom_News_card.dart';

class Advertisements extends StatefulWidget {
  const Advertisements({super.key});

  @override
  State<Advertisements> createState() => _AdvertisementsState();
}

class _AdvertisementsState extends State<Advertisements> {
  final PageController _pageController = PageController();

  Timer? _timer;

  int currentIndex = 0;

  final int itemCount = 5;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_pageController.hasClients) return;

      final nextIndex = (currentIndex + 1) % itemCount;

      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: MediaQuery.of(context).size.width > SizeConfig.tablet ? 300 : 160,
      child: PageView.builder(
        controller: _pageController,
        itemCount: itemCount,
        onPageChanged: (index) {
          currentIndex = index;
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CustomNewsCard(
              image: const AssetImage('assets/images/1.png'),
              title: l10n.adDescription,
              author: l10n.adTitle,
              date: '21 Aug, 2025',
            ),
          );
        },
      ),
    );
  }
}
