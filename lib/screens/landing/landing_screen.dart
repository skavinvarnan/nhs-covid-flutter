import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nhs_covid_19/screens/guidelines/guidelines_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/landing_screen_widgets.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 100),
      () => _showDisclaimerOnce(context),
    );
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
                child: LandingButton(
                  title: "COVID-19 Guidelines",
                  bgColor: Colors.blue,
                  isLocked: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuidelinesScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: MessageOfTheDay(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _checkIfActiveInternetConnectionPresent(BuildContext context) async {
    check().then((internet) {
      if (internet != null && internet) {
        return;
      }
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: Text(
                  "Your internet connection seems to be unstable. Please have an active internet connection and try launching the app."),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  void _showDisclaimerOnce(BuildContext context) async {
    _checkIfActiveInternetConnectionPresent(context);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var test = prefs.getBool("showed_disclaimer");
    if (test != null) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Disclaimer'),
          content: SingleChildScrollView(
            child: Text(
                "The contents of this App were collated by Lancashire Teaching Hospitals NHS Foundation Trust (LTHTR). As such, the use of this App by any person(s), including health-professionals working at other hospitals, is at their own risk, and LTHTR makes no representation or guarantee as to the adequacy or completeness of any of the information herein contained in this App, or its compatibility with the policies or procedures of other hospitals. The App is intended as a tool to support healthcare-professionals working within LTHTR and is provided as a source of reference only. This App will be updated from time to time and it is the responsibility of the person downloading the App to ensure that the most recent version is installed and in use. LTHTR shall not be liable for any claims or losses arising from the use or misuse of this App, its contents, and any omissions from its contents or otherwise. All users are advised that other hospitals will have documentation covering the subject matter of this App. Such guidance documents should be used by persons working in hospitals other than LTHTR and, in these circumstances, locally issued guidance takes precedence over any information or guidance supplied within this App."),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Disagree'),
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                }
              },
            ),
            FlatButton(
              child: Text('Agree'),
              onPressed: () {
                prefs.setBool("showed_disclaimer", true);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
