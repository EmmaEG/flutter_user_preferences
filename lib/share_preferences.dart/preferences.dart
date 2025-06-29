import 'package:shared_preferences/shared_preferences.dart';
// Preferences es para almacenar los datos de preferencias del usuario en disco duro, solo se pierden si el usuario elimina la app
class Preferences {

  static late SharedPreferences _prefs; // el late es para idicar que esta propiedad cuando se vaya a usar ya va a estar inicalizada
  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;
  
  // para incializar mi calse no lo puedo hacer con un constructor porque el procedimiento es asincrono para esta librería, entonces lo
  // resuelvo con un Future
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get getName {
    return _prefs.getString('name') ?? _name;
  }

  static set setName (String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get getIsDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set setIsDarkMode (bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get getGender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set setGender (int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }


}