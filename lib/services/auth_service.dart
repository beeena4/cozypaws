import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  final String _usersKey = 'users';

  Future<void> register(String name, String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final users = prefs.getStringList(_usersKey) ?? [];

      // Validasi name
      if (name.isEmpty) {
        throw Exception('Nama harus diisi');
      }
      if (name.length < 3) {
        throw Exception('Nama minimal 3 karakter');
      }

      // Validasi email
      if (email.isEmpty) {
        throw Exception('Email harus diisi');
      }
      if (!_isValidEmail(email)) {
        throw Exception('Email harus menggunakan format @gmail.com');
      }

      // Validasi password
      if (password.isEmpty) {
        throw Exception('Password harus diisi');
      }
      if (password.length < 8) {
        throw Exception('Password minimal 8 karakter');
      }

      // Cek apakah user sudah ada
      final isExisting = await isUserExists(name, email);
      if (isExisting) {
        throw Exception('Nama atau Email sudah terdaftar');
      }

      // Simpan user baru
      final newUser = User(name: name, email: email, password: password);
      users.add(newUser.encode());
      await prefs.setStringList(_usersKey, users);
    } catch (e) {
      throw Exception('Registrasi gagal: ${e.toString()}');
    }
  }

  Future<bool> login(String nameOrEmail, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final users = prefs.getStringList(_usersKey) ?? [];

      return users.any((user) {
        try {
          final userData = User.decode(user);
          return (userData.name == nameOrEmail ||
                  userData.email == nameOrEmail) &&
              userData.password == password;
        } catch (e) {
          return false;
        }
      });
    } catch (e) {
      throw Exception('Login gagal: ${e.toString()}');
    }
  }

  Future<bool> isUserExists(String name, String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final users = prefs.getStringList(_usersKey) ?? [];

      return users.any((user) {
        try {
          final userData = User.decode(user);
          return userData.name == name || userData.email == email;
        } catch (e) {
          return false;
        }
      });
    } catch (e) {
      throw Exception('Gagal mengecek user: ${e.toString()}');
    }
  }

   Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usersKey);
  }

  Future<List<User>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList(_usersKey) ?? [];
    return users.map((u) => User.decode(u)).toList();
  }
  // Helper untuk validasi email Gmail
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.\-]+@gmail\.com$');
    return regex.hasMatch(email);
  }
}
