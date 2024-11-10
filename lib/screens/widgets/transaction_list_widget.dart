import 'package:flutter/material.dart';
import 'package:metro/screens/transaction_details_screen.dart';
import 'package:metro/models/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 0, // Will be replaced with actual transactions
      itemBuilder: (context, index) {
        final transaction = Transaction(
          amount: 0.0,
          date: DateTime.now(),
          transactionType: TransactionType.commute,
          fromStation: 'Station Name',
        ); // Create or get transaction from your data source
        return Card(
          child: ListTile(
            title: const Text('Station Name'),
            subtitle: const Text('Transaction Type'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('৳ 0.00'),
                Text(
                  'Date Time',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionDetailsScreen(
                    transaction: transaction,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}