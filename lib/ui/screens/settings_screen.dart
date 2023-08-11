import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Configuración'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_right),
            title: Text('Colaboradores'),
            subtitle: Text('Registro de colaboradores'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month_outlined),
            trailing: Icon(Icons.arrow_right),
            title: Text('Número de dias quincena'),
            subtitle:
                Text('Dias en los cuales es aplicable el reparto de alimentos'),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            trailing: Icon(Icons.arrow_right),
            title: Text('Presupuesto Quincenal'),
            subtitle: Text('\$0.00'),
          ),
          ListTile(
            leading: Icon(Icons.coffee),
            title: Text('Número desayunos'),
            subtitle: Text('58'),
          ),
          ListTile(
            leading: Icon(Icons.fastfood_rounded),
            title: Text('Número comidas'),
            subtitle: Text('58'),
          )
        ],
      ),
    );
  }
}
