import 'package:flutter/material.dart';
import 'package:metro/models/station.dart';
import 'package:metro/services/fare_service.dart';
import 'package:metro/screens/widgets/station_selector_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final FareService _fareService = FareService();
  Station? _fromStation;
  Station? _toStation;
  int? _fare;

  void _calculateFare() {
    if (_fromStation != null && _toStation != null) {
      setState(() {
        _fare = _fareService.calculateFare(_fromStation!, _toStation!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final stations = _fareService.getAllStations();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fare Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StationSelectorWidget(
              label: 'From Station',
              stations: stations,
              onStationSelected: (station) {
                setState(() {
                  _fromStation = station;
                  _fare = null;
                });
              },
            ),
            const SizedBox(height: 16),
            StationSelectorWidget(
              label: 'To Station',
              stations: stations,
              onStationSelected: (station) {
                setState(() {
                  _toStation = station;
                  _fare = null;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _fromStation != null && _toStation != null 
                  ? _calculateFare 
                  : null,
              child: const Text('Calculate Fare'),
            ),
            if (_fare != null) ...[
              const SizedBox(height: 24),
              Text(
                'Fare: ৳$_fare',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}