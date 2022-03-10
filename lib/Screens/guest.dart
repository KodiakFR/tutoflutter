import 'package:flutter/material.dart';
import 'package:leadeetuto/Screens/guest/Auth.dart';
import 'package:leadeetuto/Screens/guest/Password.dart';
import 'package:leadeetuto/Screens/guest/Term.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> _widget = [];
  int _indexSelected = 0;

  @override
  void initState() {
    super.initState();

    _widget.addAll([
      AuthScreen(onChangedStep: (index) {
        setState(() {
          _indexSelected = index;
        });
      } ),
      TermScreen(onChangedStep: (index) {
        setState(() {
          _indexSelected = index;
        });
      } ),
      PasswordScreen(onChangedStep: (index) {
        setState(() {
          _indexSelected = index;
        });
      } ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.elementAt(_indexSelected),
    );
  }
}
