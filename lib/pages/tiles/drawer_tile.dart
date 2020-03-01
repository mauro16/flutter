import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  DrawerTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 22.0,
                color: Colors.pink[200],
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
