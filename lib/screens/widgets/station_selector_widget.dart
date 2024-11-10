import 'package:flutter/material.dart';
import 'package:metro/models/station.dart';

class StationSelectorWidget extends StatelessWidget {
  final String label;
  final List<Station> stations;
  final Function(Station) onStationSelected;

  const StationSelectorWidget({
    super.key,
    required this.label,
    required this.stations,
    required this.onStationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Station>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: stations.map((station) {
        return DropdownMenuItem(
          value: station,
          child: Text(station.name),
        );
      }).toList(),
      onChanged: (station) {
        if (station != null) {
          onStationSelected(station);
        }
      },
    );
  }
}