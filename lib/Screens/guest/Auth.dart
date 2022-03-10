import 'package:flutter/material.dart';
import 'package:leadeetuto/main.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const AuthScreen({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                    text: 'Everyone has\n'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'knowledge\n'.toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'to share'.toUpperCase(),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'It all starts here.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    key: _globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Enter your email'),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          onChanged: (value) => setState(() {
                            _email = value;
                          }),
                          validator: (value) =>
                              value!.isEmpty || !emailRegex.hasMatch(value)
                                  ? 'Please enter a valid email'
                                  : null,
                          decoration: InputDecoration(
                            hintText: 'Ex : maxime.braud@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 15.0,
                            top: 15.0,
                          ),
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            onPressed: !emailRegex.hasMatch(_email)
                                ? null
                                : () {
                                    if (_globalKey.currentState!.validate()) {
                                      print(_email);
                                      widget.onChangedStep(1);                                    }
                                  },
                            child: Text(
                              'continue'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
