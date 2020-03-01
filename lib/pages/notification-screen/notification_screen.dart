import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Make me Bella",
          style: TextStyle(
            fontFamily: "DollieScript",
            fontSize: 30,
            fontWeight: FontWeight.w100,
            color: Colors.pink,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            // child: Icon(
            //   Icons.more_vert,
            //   color: Colors.white,
            // ),
          ),
        ],
        elevation: 1.1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "Klicken Sie hier, um Ihre Arbeit zu veröffentlichen.",
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
