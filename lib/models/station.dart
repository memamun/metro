class Station {
  final String name;
  final int id;

  const Station({
    required this.name,
    required this.id,
  });
}

class FareCalculator {
  static final FareCalculator _instance = FareCalculator._internal();
  
  factory FareCalculator() {
    return _instance;
  }

  FareCalculator._internal();

  final List<Station> stations = [
    const Station(name: "Uttara North", id: 0),
    const Station(name: "Uttara Center", id: 1),
    const Station(name: "Uttara South", id: 2),
    const Station(name: "Pallabi", id: 3),
    const Station(name: "Mirpur 11", id: 4),
    const Station(name: "Mirpur 10", id: 5),
    const Station(name: "Kazipara", id: 6),
    const Station(name: "Shewrapara", id: 7),
    const Station(name: "Agargaon", id: 8),
    const Station(name: "Bijoy Sarani", id: 9),
    const Station(name: "Farmgate", id: 10),
    const Station(name: "Karwan Bazar", id: 11),
    const Station(name: "Shahbag", id: 12),
    const Station(name: "Dhaka University", id: 13),
    const Station(name: "Bangladesh Secretariat", id: 14),
    const Station(name: "Motijheel", id: 15),
  ];

  final Map<String, int> fareMatrix = {
    '0-1': 20, '0-2': 20, '0-3': 30, '0-4': 30, '0-5': 40,
    '0-6': 40, '0-7': 50, '0-8': 50, '0-9': 60, '0-10': 60,
    '0-11': 70, '0-12': 70, '0-13': 80, '0-14': 80, '0-15': 100,
    
    '1-2': 20, '1-3': 20, '1-4': 30, '1-5': 30, '1-6': 40,
    '1-7': 40, '1-8': 50, '1-9': 50, '1-10': 60, '1-11': 60,
    '1-12': 70, '1-13': 70, '1-14': 80, '1-15': 90,
    
    '2-3': 20, '2-4': 20, '2-5': 30, '2-6': 30, '2-7': 40,
    '2-8': 40, '2-9': 50, '2-10': 50, '2-11': 60, '2-12': 60,
    '2-13': 70, '2-14': 70, '2-15': 80,
    
    '3-4': 20, '3-5': 20, '3-6': 30, '3-7': 30, '3-8': 40,
    '3-9': 40, '3-10': 50, '3-11': 50, '3-12': 60, '3-13': 60,
    '3-14': 70, '3-15': 70,
    
    '4-5': 20, '4-6': 20, '4-7': 30, '4-8': 30, '4-9': 40,
    '4-10': 40, '4-11': 50, '4-12': 50, '4-13': 60, '4-14': 60,
    '4-15': 70,
    
    '5-6': 20, '5-7': 20, '5-8': 30, '5-9': 30, '5-10': 40,
    '5-11': 40, '5-12': 50, '5-13': 50, '5-14': 60, '5-15': 60,
    
    '6-7': 20, '6-8': 20, '6-9': 30, '6-10': 30, '6-11': 40,
    '6-12': 40, '6-13': 50, '6-14': 50, '6-15': 60,
    
    '7-8': 20, '7-9': 20, '7-10': 30, '7-11': 30, '7-12': 40,
    '7-13': 40, '7-14': 50, '7-15': 50,
    
    '8-9': 20, '8-10': 20, '8-11': 30, '8-12': 30, '8-13': 40,
    '8-14': 40, '8-15': 50,
    
    '9-10': 20, '9-11': 20, '9-12': 30, '9-13': 30, '9-14': 40,
    '9-15': 40,
    
    '10-11': 20, '10-12': 20, '10-13': 30, '10-14': 30, '10-15': 40,
    
    '11-12': 20, '11-13': 20, '11-14': 30, '11-15': 30,
    
    '12-13': 20, '12-14': 20, '12-15': 30,
    
    '13-14': 20, '13-15': 20,
    
    '14-15': 20,
  };

  int calculateFare(Station from, Station to) {
    if (from.id == to.id) return 0;
    final key = '${from.id}-${to.id}';
    final reverseKey = '${to.id}-${from.id}';
    return fareMatrix[key] ?? fareMatrix[reverseKey] ?? 0;
  }

  List<Station> getAllStations() => stations;

  Station? getStation(String name) {
    try {
      return stations.firstWhere((station) => station.name == name);
    } catch (e) {
      return null;
    }
  }

  Station? getStationById(int id) {
    try {
      return stations.firstWhere((station) => station.id == id);
    } catch (e) {
      return null;
    }
  }
}