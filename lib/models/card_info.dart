enum CardState {
  balance,
  waitingForTap,
  reading,
  error,
  noNfcSupport,
  nfcDisabled
}

class CardInfo {
  final CardState state;
  final int? balance;
  final String? errorMessage;

  CardInfo({
    required this.state,
    this.balance,
    this.errorMessage,
  });

  factory CardInfo.initial() {
    return CardInfo(state: CardState.waitingForTap);
  }

  factory CardInfo.balance(int amount) {
    return CardInfo(state: CardState.balance, balance: amount);
  }

  factory CardInfo.error(String message) {
    return CardInfo(state: CardState.error, errorMessage: message);
  }
}