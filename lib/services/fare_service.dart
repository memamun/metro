import 'package:metro/models/station.dart';

class FareService {
  final FareCalculator _calculator = FareCalculator();

  int calculateFare(Station from, Station to) {
    return _calculator.calculateFare(from, to);
  }

  List<Station> getAllStations() {
    return _calculator.getAllStations();
  }

  Station? findStationByName(String name) {
    return _calculator.getStation(name);
  }

  Station? findStationById(int id) {
    return _calculator.getStationById(id);
  }

  // Additional method for calculating discounted fare (for pass holders)
  int calculateDiscountedFare(Station from, Station to) {
    final baseFare = calculateFare(from, to);
    return (baseFare * 0.9).round(); // 10% discount for pass holders
  }
}