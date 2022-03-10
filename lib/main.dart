import 'package:flutter/material.dart';
import 'package:leadeetuto/Screens/guest.dart';
import 'package:leadeetuto/Screens/guest/Password.dart';
import 'package:leadeetuto/Screens/guest/Auth.dart';
import 'package:leadeetuto/Screens/guest/Term.dart';



void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leadee',
      home: GuestScreen(),
    );
  }
}

