import 'package:assignment/cart/cart_page.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orbit Assignment',
      initialRoute: "/",
      routes: {
        "/": (_) => const HomePage(),
        "/cart": (_) => const CartPage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        // textTheme: GoogleFonts.latoTextTheme(),
      ),
    );
  }
}
