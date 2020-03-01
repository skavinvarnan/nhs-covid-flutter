import 'package:flutter/material.dart';
import 'package:nhs_covid_19/screens/otb_details/otb_details_screen.dart';

import 'widgets/guideline_list_screen_widgets.dart';

class GuidelineListScreen extends StatelessWidget {
  final String title;
  final List items;

  GuidelineListScreen({@required this.title, @required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: GuidelineList(items: this.items),
    );
  }
}

class GuidelineList extends StatelessWidget {
  final List items;

  GuidelineList({@required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.items.length,
      itemBuilder: (context, index) {
        final listItem = items[index];
        return GuidelineListButton(
          title: "${index + 1}. ${listItem['title']}",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTBDetailScreen(
                  markdown: listItem['body'],
                  title: listItem['title'],
                ),
              ),
            );
          },
          bgColor: Colors.blue,
        );
      },
    );
  }
}
