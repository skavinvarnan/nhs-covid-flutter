import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LandingButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final MaterialColor bgColor;
  final bool isLocked;

  LandingButton({
    @required this.title,
    @required this.onPressed,
    @required this.bgColor,
    @required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [bgColor.shade600, bgColor.shade800],
              end: Alignment(-1.0, -2.5),
              begin: Alignment(1.0, 2.5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          width: double.infinity,
          height: 80,
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  this.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: _lockIcon(),
                ),
              ),
            ],
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }

  Widget _lockIcon() {
    if (this.isLocked) {
      return Icon(Icons.lock, color: Colors.white, size: 16.0);
    } else {
      return SizedBox.shrink();
    }
  }
}

class MessageOfTheDay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String query = """
      query {
        utilities {
          messageOfTheDay
        }
      }
    """;
    return Query(
      options: QueryOptions(documentNode: gql(query)),
      builder: (
        QueryResult result, {
        VoidCallback refetch,
        FetchMore fetchMore,
      }) {
        if (result.hasException) {
          print(result.exception.toString());
          return Text("");
        }

        if (result.loading) {
          return Text("Loading...", style: TextStyle(color: Colors.black, fontSize: 20),);
        }

        // it can be either Map or List
        List listItems = result.data['utilities'];

        if (listItems.length > 0) {
          return Text(listItems[0]["messageOfTheDay"], style: TextStyle(color: Colors.black, fontSize: 20,), textAlign: TextAlign.center,);
        } else {
          return Text("");
        }
      },
    );
  }
}
