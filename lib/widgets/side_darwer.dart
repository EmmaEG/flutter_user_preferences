import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/screens/screens.dart';

class SideDarwer extends StatelessWidget {
  const SideDarwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),
          ListTile(
            leading: Icon(Icons.pages_outlined),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text('People'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
            onTap: () {
              // Navigator.pop(context); // to close menu or dialogue
              // Navigator.pushNamed(context, SettingScreen.routeName);
              Navigator.pushReplacementNamed(context, SettingScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover
          ),
      ),
      child: Container(),
    );
  }
}
