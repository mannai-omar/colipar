import 'package:colipar/models/Place.dart';
import 'package:colipar/widgets/text_field.dart';
import 'package:flutter/material.dart';

final List<Port> ports = [
  // Ports de la Tunisie
  Port(name: 'Port de Bizerte', code: 'BZT'),
  Port(name: 'Port de Gabès', code: 'GAB'),
  Port(name: 'Port de La Goulette', code: 'LGT'),
  Port(name: 'Port de Radès', code: 'RAD'),
  Port(name: 'Port de Sfax', code: 'SFA'),
  Port(name: 'Port de Sousse', code: 'SSU'),
  Port(name: 'Port de Zarzis', code: 'ZAR'),

  // Ports de la France
  Port(name: 'Port de Marseille', code: 'MRS'),
  Port(name: 'Port de Le Havre', code: 'LEH'),
  Port(name: 'Port de Dunkerque', code: 'DUNK'),
  Port(name: 'Port de Rouen', code: 'ROU'),
  Port(name: 'Port de Nantes-Saint-Nazaire', code: 'NTE'),
  Port(name: 'Port de Bordeaux', code: 'BOD'),
  Port(name: 'Port de Calais', code: 'CAL'),
  Port(name: 'Port de Strasbourg', code: 'SXB'),
  Port(name: 'Port de Toulon', code: 'TLN'),
  Port(name: 'Port de Bayonne', code: 'BAI'),
];

final List<Airport> airports = [
  // Aéroports de la Tunisie
  Airport(name: 'Aéroport Tunis Carthage', code: 'TUN'),
  Airport(name: 'Aéroport Enfidha-Hammamet', code: 'NBE'),
  Airport(name: 'Aéroport Djerba-Zarzis', code: 'DJE'),
  Airport(name: 'Aéroport Monastir Habib Bourguiba', code: 'MIR'),
  Airport(name: 'Aéroport Sfax-Thyna', code: 'SFA'),
  Airport(name: 'Aéroport Tozeur-Nefta', code: 'TOE'),
  Airport(name: 'Aéroport Gabès Matmata', code: 'GAE'),
  Airport(name: 'Aéroport Gafsa Ksar', code: 'GAF'),
  Airport(name: 'Aéroport Tabarka-Ain Draham', code: 'TBJ'),
  // Aéroports de la France
  Airport(name: 'Aéroport Paris-Charles de Gaulle', code: 'CDG'),
  Airport(name: 'Aéroport Paris-Orly', code: 'ORY'),
  Airport(name: "Aéroport Nice Côte d'Azur", code: 'NCE'),
  Airport(name: 'Aéroport Lyon-Saint-Exupéry', code: 'LYS'),
  Airport(name: 'Aéroport Marseille Provence', code: 'MRS'),
  Airport(name: 'Aéroport Toulouse-Blagnac', code: 'TLS'),
  Airport(name: 'Aéroport Bordeaux-Mérignac', code: 'BOD'),
  Airport(name: 'Aéroport Nantes Atlantique', code: 'NTE'),
  Airport(name: 'Aéroport Lille Lesquin', code: 'LIL'),
  Airport(name: 'Aéroport Strasbourg Entzheim', code: 'SXB'),
  Airport(name: 'Aéroport Mulhouse Bâle', code: 'MLH'),
  Airport(name: 'Aéroport Rennes Bretagne', code: 'RNS'),
  Airport(name: 'Aéroport Toulon Hyères', code: 'TLN'),
  Airport(name: 'Aéroport Bastia Poretta', code: 'BIA'),
  Airport(name: 'Aéroport Ajaccio Napoléon Bonaparte', code: 'AJA'),
  Airport(name: 'Aéroport Figari Sud Corse', code: 'FSC'),
  Airport(name: 'Aéroport Calvi Sainte-Catherine', code: 'CLY'),
  Airport(name: 'Aéroport Biarritz Pays Basque', code: 'BIQ'),
  Airport(name: 'Aéroport Brest Bretagne', code: 'BES'),
  Airport(name: 'Aéroport Caen Carpiquet', code: 'CFR'),
  Airport(name: 'Aéroport Chambéry Savoie', code: 'CMF'),
  Airport(name: 'Aéroport Clermont-Ferrand Auvergne', code: 'CFE'),
  Airport(name: 'Aéroport Grenoble Isère', code: 'GNB'),
  Airport(name: 'Aéroport La Rochelle Île de Ré', code: 'LRH'),
  Airport(name: 'Aéroport Le Havre Octeville', code: 'LEH'),
  Airport(name: 'Aéroport Lorient Bretagne Sud', code: 'LRT'),
  Airport(name: 'Aéroport Metz Nancy Lorraine', code: 'ETZ'),
  Airport(name: 'Aéroport Montpellier Méditerranée', code: 'MPL'),
  Airport(name: 'Aéroport Nîmes Alès Camargue Cévennes', code: 'FNI'),
];

class AirportAutocomplete extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const AirportAutocomplete({super.key, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Place>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Place>.empty();
        }

        final bool isAirportHint = hintText.contains("Aéroport");
        final List<Place> options = isAirportHint ? airports : ports;
        return options.where((Place place) {
          return place.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      displayStringForOption: (Place option) => option.name,
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return CustomTextField(
          hintText: hintText,
          controller: textEditingController,
          icon: Icons.flight,
          focusNode: focusNode,
        );
      },
      onSelected: (Place selection) {
        if (controller != null) {
          controller!.text = selection.name;
        }
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Place> onSelected,
          Iterable<Place> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final Place option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option.name),
                      subtitle: Text(option.code),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
