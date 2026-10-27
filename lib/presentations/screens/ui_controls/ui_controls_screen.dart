import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = "ui_controls_screen";

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Controls"),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({super.key});

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation {car, plane, boat, submarine}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloperMode = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text("Dev Mode"),
            subtitle: Text("Additional Controls"),
            value: isDeveloperMode,
            onChanged: (value) => setState(() {
              isDeveloperMode = value;
            })
          ),
        ExpansionTile(
            title: Text("Vehículo de transporte"),
            subtitle: Text("$selectedTransportation"),
            children: [
              RadioGroup<Transportation>(
                groupValue: selectedTransportation,
                onChanged: (value) {

                  setState(() {
                    selectedTransportation = value ?? Transportation.boat;
                    print("value: $selectedTransportation");
                  });
                },
                child: Column(
                  children: [
                    RadioListTile<Transportation>(
                        value: Transportation.car,
                        title: Text("Car"),
                        subtitle: Text("Viaje por carro"),
                    ),
                    RadioListTile<Transportation>(
                        value: Transportation.plane,
                        title: Text("Plane"),
                        subtitle: Text("Viaje por avión"),
                    ),
                    RadioListTile<Transportation>(
                        value: Transportation.boat,
                        title: Text("Boat"),
                        subtitle: Text("Viaje por bote"),
                    ),
                    RadioListTile<Transportation>(
                        value: Transportation.submarine,
                        title: Text("Submarine"),
                        subtitle: Text("Viaje por submarino"),
                    ),
                  ],
                ),
              )
            ]
        ),

        // TODO:

        CheckboxListTile(
          title: const Text("Desayuno"),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
              wantsBreakfast = value ?? false;
            })
        ),
        CheckboxListTile(
          title: const Text("Comida"),
            value: wantsLunch,
            onChanged: (value) => setState(() {
              wantsLunch = value ?? false;
            })
        ),
        CheckboxListTile(
          title: const Text("Cena"),
            value: wantsDinner,
            onChanged: (value) => setState(() {
              wantsDinner = value ?? false;
            })
        ),
      ],
    );
  }
}
