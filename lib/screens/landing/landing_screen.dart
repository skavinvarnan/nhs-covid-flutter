import 'package:flutter/material.dart';

import 'widgets/landing_screen_widgets.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            LandingButton(
              title: "Guidelines",
              bgColor: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
