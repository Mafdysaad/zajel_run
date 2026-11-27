import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class ResendCodeTimer extends StatefulWidget {
  final VoidCallback onResend;
  final int seconds;

  const ResendCodeTimer({super.key, required this.onResend, this.seconds = 60});

  @override
  State<ResendCodeTimer> createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  Timer? timer;
  late int remainingSeconds;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    widget.onResend();

    setState(() {
      remainingSeconds = widget.seconds;
    });

    startTimer();
  }

  String get formattedTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');

    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.didntReceiveTheCode, style: TextStyle(fontSize: 14)),

        if (remainingSeconds > 0)
          Text(
            formattedTime,
            style: const TextStyle(
              color: Color(0xFF246775),
              fontWeight: FontWeight.bold,
            ),
          )
        else
          TextButton(
            onPressed: resendCode,
            child: Text(
              l10n.resendCode,
              style: TextStyle(
                color: Color(0xFF246775),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
