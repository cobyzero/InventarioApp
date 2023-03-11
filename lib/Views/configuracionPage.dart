import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/colors.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
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
