enum TransactionType {
  commute('Commute'),
  balanceUpdate('Balance Update');

  final String label;
  const TransactionType(this.label);
}

class Transaction {
  final double amount;
  final DateTime date;
  final TransactionType transactionType;
  final String fromStation;
  final String? toStation;
  final int? balance;

  Transaction({
    required this.amount,
    required this.date,
    required this.transactionType,
    required this.fromStation,
    this.toStation,
    this.balance,
  });

  String get displayText {
    switch (transactionType) {
      case TransactionType.commute:
        return '$fromStation → ${toStation ?? "Unknown"}';
      case TransactionType.balanceUpdate:
        return 'Balance updated at $fromStation';
    }
  }

  String get amountText {
    final prefix = amount >= 0 ? '+' : '';
    return '$prefix৳${amount.abs()}';
  }
}

class TransactionWithAmount {
  final Transaction transaction;
  final int? amount;

  TransactionWithAmount({
    required this.transaction,
    this.amount,
  });
}