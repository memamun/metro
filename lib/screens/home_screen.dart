import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metro/services/nfc_service.dart';
import 'package:metro/screens/widgets/card_balance_widget.dart';
import 'package:metro/screens/widgets/transaction_list_widget.dart';
import 'package:metro/models/card_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize NFC service
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await context.read<NFCService>().initialize();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('NFC is not available on this device'),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metro Card'),
      ),
      body: Consumer<NFCService>(
        builder: (context, nfcService, child) {
          final cardState = nfcService.isAvailable 
              ? CardState.waitingForTap 
              : CardState.noNfcSupport;
          
          final lastTransaction = nfcService.transactions.isNotEmpty 
              ? nfcService.transactions.last 
              : null;

          return Column(
            children: [
              CardBalanceWidget(
                cardState: cardState,
                balance: lastTransaction?.amount.toInt(),
              ),
              const Expanded(
                child: TransactionListWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}