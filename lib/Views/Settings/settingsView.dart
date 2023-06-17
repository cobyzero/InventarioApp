import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Util/colors.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BaseVentana(
          fun: Column(
        children: [
          Row(
            children: [
              const Text(
                "Configuracion",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
        ],
      )),
    );
  }
}
