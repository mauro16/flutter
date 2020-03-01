import 'package:flutter/material.dart';
import 'package:makemebela/pages/filter/filter_screen.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.pink,
          blurRadius: 0.0,
          offset: Offset(1, 0),
        )
      ]),
      child: Row(
        children: <Widget>[
          BarButton(
            label: "Kategorien",
            boxDecoration: BoxDecoration(color: Colors.white),
            onPressed: () {},
          ),
          BarButton(
            label: "Filter",
            boxDecoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: Colors.black),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FilterScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
