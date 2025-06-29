# flutter_user_preferences

Una app Flutter simple para aprender y gestionar **preferencias de usuario persistentes** utilizando [`shared_preferences`](w) y [`provider`](w). Las preferencias se guardan localmente en el disco del dispositivo, y se actualizan en tiempo real gracias al manejo de estado con Provider.

## ✨ Características

- Guardado y carga de preferencias del usuario (como temas, flags, etc.)
- Persistencia de datos con `shared_preferences`
- Gestión de estado reactivo con `provider`
- Ejemplo simple y entendible, ideal para aprender o reutilizar

## 🛠️ Tecnologías y dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.5.3
  provider: ^6.1.5
