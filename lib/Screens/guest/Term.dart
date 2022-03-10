import 'package:flutter/material.dart';
import 'package:leadeetuto/main.dart';

class TermScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const TermScreen({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  ScrollController? _scrollController;
  bool _termsRead = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange) {
        setState(() {
          _termsRead = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Terms & Conditions',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              widget.onChangedStep(0);
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'The Flutter website (the “Website”) is hosted by Google. By using and / or visiting the Website, you consent to be bound by Google’s general Terms of Service and Privacy Policy. \n\n The “Flutter” name and the Flutter logo Flutter logo (the “Flutter Marks”) are trademarks owned by Google and are not included within the assets licensed under the Creative Commons Attribution 4.0 International License. Google grants you a non-transferable, non-exclusive, royalty-free limited license to use the Flutter Marks subject to your compliance with the Flutter Brand Guidelines. Except as set forth above, nothing herein grants or should be deemed to grant to you any right, title or interest in or to the Flutter Marks.\n\n As noted above, Google owns the Flutter trademarks, but we license them so they can be used by the developer community to support the Flutter SDK, including through training materials and other community content. \n\n At the same time, it’s important to make sure that people don’t use the marks in ways that could cause confusion or otherwise misuse the marks, so we have prepared brand guidelines that describe the allowed uses of the marks. Our goal in protecting the Flutter trademarks is to benefit the entire community by ensuring that the marks are only used in ways that are consistent with Google’s mission to provide a free and open source SDK.The “Flutter” name and logo are trademarks owned by Google. These Brand Guidelines describe the appropriate uses of the Flutter trademarks by members of the developer community who have obtained our consent to use the trademarks pursuant to the Flutter Terms of Service. These guidelines will ensure that the Flutter trademarks are used in a manner that promotes Google’s mission to provide a free and open source SDK for crafting high-quality native interfaces on iOS and Android in record time, and are not associated with objectionable material, as determined by Google. \n\n Use of the Flutter trademarks that is not expressly permitted by these guidelines is prohibited absent written permission from Google. \n\n The official Flutter logos can be found in the Flutter and Dart logo assets. \n\n',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                    onPressed: !_termsRead ? null : () {
                      widget.onChangedStep(2);
                    },
                    child: Text(
                      'read & accept'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
