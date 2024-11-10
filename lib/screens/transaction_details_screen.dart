import 'package:flutter/material.dart';
import 'package:metro/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailsScreen({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Amount', transaction.amountText),
            const SizedBox(height: 8),
            _buildDetailItem('Date', DateFormat('MMM d, y h:mm a').format(transaction.date)),
            const SizedBox(height: 8),
            _buildDetailItem('Type', transaction.transactionType.label),
            const SizedBox(height: 8),
            _buildDetailItem('From Station', transaction.fromStation),
            if (transaction.toStation != null) ...[
              const SizedBox(height: 8),
              _buildDetailItem('To Station', transaction.toStation!),
            ],
            if (transaction.balance != null) ...[
              const SizedBox(height: 8),
              _buildDetailItem('Balance', '৳${transaction.balance}'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
} 