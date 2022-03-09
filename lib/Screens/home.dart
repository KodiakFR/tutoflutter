import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Leadee'),
        ),
        body: Container(
          // ignore: prefer_const_constructors
          child: Center(
            child: const Text("Coucou tout le monde"),
          )
          
        ),
      ),
    );
  }
}