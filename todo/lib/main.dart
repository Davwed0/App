import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/to_do_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'pages/sign_up_page.dart';
import 'theme.dart';

void main() async {
  await Hive.initFlutter();

  // ignore: unused_local_variable
  var database = await Hive.openBox("database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      home: ToDoPage(),
    );
  }
}
