import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/share_preferences.dart/preferences.dart';
import 'package:flutter_user_preferences/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = '/HomeScreen';
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Home', style: TextStyle(color: Colors.white)),
      ),
      drawer: SideDarwer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Text('esTemaOcuro: ${Preferences.getIsDarkMode}'),
          Divider(),
          Text('Género: ${Preferences.getGender}'),
          Divider(),
          Text('Nombre de usuario: ${Preferences.getName}')
         ],
      ),
    );
  }
}