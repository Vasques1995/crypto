import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CryptTitle extends StatelessWidget {
  final String cypherTitle;

  const CryptTitle({Key key, this.cypherTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      cypherTitle,
      style: TextStyle(
        //TODO Grab from global theme
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: NeumorphicTheme.currentTheme(context).accentColor
      )
    );
  }
}
