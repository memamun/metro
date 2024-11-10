import 'package:flutter/material.dart';
import 'package:metro/models/card_info.dart';

class CardBalanceWidget extends StatelessWidget {
  final CardState cardState;
  final int? balance;

  const CardBalanceWidget({
    super.key,
    required this.cardState,
    this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card Balance',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              balance != null ? '৳ $balance' : 'Tap card to check balance',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (cardState == CardState.error)
              Text(
                'Error reading card',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            if (cardState == CardState.noNfcSupport)
              Text(
                'NFC not available',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ],
        ),
      ),
    );
  }
}