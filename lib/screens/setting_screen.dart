import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/provider/theme_provider.dart';
import 'package:flutter_user_preferences/share_preferences.dart/preferences.dart';
import 'package:flutter_user_preferences/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/SettingScreen';

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Emma';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      drawer: SideDarwer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Ajustes',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
              Divider(),
              SwitchListTile.adaptive(
                value: Preferences.getIsDarkMode,
                title: Text('Modo Oscuro'),
                onChanged: (value) {
                  Preferences.setIsDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: Preferences.getGender,
                title: Text('Masculino'),
                onChanged: (value) {
                  Preferences.setGender = value ?? 1;
                  setState(() {});
                },
              ),
              Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.getGender,
                title: Text('Femenino'),
                onChanged: (value) {
                  Preferences.setGender = value ?? 2;
                  setState(() {});
                },
              ),
              Divider(),
              TextFormField(
                initialValue: Preferences.getName,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario',
                ),
                onChanged: (value) {
                  Preferences.setName = value;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
