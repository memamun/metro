import 'package:get_it/get_it.dart';
import 'package:metro/services/nfc_service.dart';
import 'package:metro/services/localization_service.dart';
import 'package:metro/services/storage_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Create instances
  final storageService = StorageService();
  final nfcService = NFCService();
  final localizationService = LocalizationService();

  // Initialize services
  await storageService.initialize();
  await nfcService.initialize();
  await localizationService.initialize();

  // Register services
  getIt.registerSingleton<StorageService>(storageService);
  getIt.registerSingleton<NFCService>(nfcService);
  getIt.registerSingleton<LocalizationService>(localizationService);
}