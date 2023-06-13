import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:what_is_left/home_screen.dart';
import 'package:what_is_left/pick_date_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: cachedBirthDate(),
        builder: ((context, snapshot) {
          if (snapshot.hasData && snapshot.data != 'null') {
            return HomeScreen(birthDate: snapshot.data!);
          } else {
            return const PickDateScreen();
          }
        }),
      ),
    );
  }
}

Future<String?> cachedBirthDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String birthDate = prefs.getString('birthDate') ?? 'null';
  return birthDate;
}

Future<void> cacheBirthDate(String birthDate) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('birthDate', birthDate);
}
