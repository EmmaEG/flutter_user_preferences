import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/provider/theme_provider.dart';
import 'package:flutter_user_preferences/screens/screens.dart';
import 'package:flutter_user_preferences/share_preferences.dart/preferences.dart';
import 'package:provider/provider.dart';

// convierto el main en asincrono para levantar las preferencias que es asincrona
// esta estrategia es porque dentro de MyApp el build siempre es sincrono
// void main() => runApp(const MyApp());

void main() async {
  // El método WidgetsFlutterBinding.ensureInitialized() se usa en Flutter para asegurarse de que el sistema de bindings esté inicializado
  // antes de que empieces a usar cualquier funcionalidad que lo requiera, especialmente antes del runApp().
  WidgetsFlutterBinding.ensureInitialized(); // “Pará, todavía no arranques el motor, primero tengo que preparar algunas cosas”.
  await Preferences.init();
  // runApp(const MyApp());
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode: Preferences.getIsDarkMode))
    ],
    child: const MyApp(), // en este caso como necesito acceder desde el main al provider puedo correr la app así, pasando MyApp como child
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SettingScreen.routeName: (_) => SettingScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
