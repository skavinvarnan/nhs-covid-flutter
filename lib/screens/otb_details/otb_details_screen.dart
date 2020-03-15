import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nhs_covid_19/screens/webview/webview_screen.dart';

class OTBDetailScreen extends StatelessWidget {
  final String markdown;
  final String title;

  OTBDetailScreen({@required this.title, @required this.markdown});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SafeArea(
        child: Container(
          child: Markdown(
            data: this.markdown,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                .copyWith(
                    p: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 20.0)),
            onTapLink: (href) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewScreen(
                    url: href,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
