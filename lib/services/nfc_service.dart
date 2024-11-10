import 'package:flutter/foundation.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:metro/models/transaction.dart';

class NFCService extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  bool _isAvailable = false;
  
  List<Transaction> get transactions => _transactions;
  bool get isAvailable => _isAvailable;

  Future<void> initialize() async {
    try {
      _isAvailable = !kIsWeb && await NfcManager.instance.isAvailable();
    } catch (e) {
      _isAvailable = false;
      debugPrint('NFC not available: $e');
    }
    notifyListeners();
  }

  Future<void> startSession() async {
    if (!_isAvailable) return;
    
    try {
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Implement NFC tag reading logic here
          // Parse card data and create Transaction objects
        },
        onError: (error) async {
          debugPrint('Error reading NFC: $error');
        },
      );
    } catch (e) {
      debugPrint('Failed to start NFC session: $e');
    }
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    super.dispose();
  }
}