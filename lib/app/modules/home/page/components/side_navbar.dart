import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:redes_av1/app/core/enum/enum_cipher.dart';
import 'package:redes_av1/app/modules/home/controller/home_controller.dart';

class SideNavbar extends StatelessWidget {
  final HomeController homeController;

  const SideNavbar({Key key, this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Observer(
          builder: (_) {
            //TODO Change to Neumorphic Containers and hook-up logic to controller
            return NeumorphicRadio(
              style: NeumorphicRadioStyle(
                selectedColor: NeumorphicTheme.currentTheme(context).accentColor,
              ),
              duration: Duration(milliseconds: 200),
              isEnabled: true,
              groupValue: homeController.cypherEnum,
              value: Cypher.CESAR,
              onChanged: (value) {
                homeController.changeCypher(value);
              },
              padding: EdgeInsets.all(18),
              child: Icon(Icons.event_seat),
            );
          },
        ),
        Observer(
          builder: (_) {
            return NeumorphicRadio(
              style: NeumorphicRadioStyle(
                selectedColor: NeumorphicTheme.currentTheme(context).accentColor,
              ),
              duration: Duration(milliseconds: 200),
              isEnabled: true,
              groupValue: homeController.cypherEnum,
              value: Cypher.XOR,
              onChanged: (value) {
                homeController.changeCypher(value);
              },
              padding: EdgeInsets.all(18),
              child: Icon(Icons.keyboard_arrow_up),
            );
          },
        ),
        Observer(
          builder: (_) {
            return NeumorphicRadio(
              style: NeumorphicRadioStyle(
                selectedColor: NeumorphicTheme.currentTheme(context).accentColor,
              ),
              duration: Duration(milliseconds: 200),
              isEnabled: true,
              groupValue: homeController.cypherEnum,
              value: Cypher.SDES,
              onChanged: (value) {
                homeController.changeCypher(value);
              },
              padding: EdgeInsets.all(18),
              child: Icon(Icons.gps_not_fixed),
            );
          },
        ),
        Observer(
          builder: (_) {
            return NeumorphicRadio(
              style: NeumorphicRadioStyle(
                selectedColor: NeumorphicTheme.currentTheme(context).accentColor,
              ),
              duration: Duration(milliseconds: 200),
              isEnabled: true,
              groupValue: homeController.cypherEnum,
              value: Cypher.DES,
              onChanged: (value) {
                homeController.changeCypher(value);
              },
              padding: EdgeInsets.all(18),
              child: Icon(Icons.gps_fixed),
            );
          },
        ),
        Observer(
          builder: (_) {
            return NeumorphicRadio(
              style: NeumorphicRadioStyle(
                selectedColor: NeumorphicTheme.currentTheme(context).accentColor,
              ),
              duration: Duration(milliseconds: 200),
              isEnabled: true,
              groupValue: homeController.cypherEnum,
              value: Cypher.AES,
              onChanged: (value) {
                homeController.changeCypher(value);
              },
              padding: EdgeInsets.all(18),
              child: Icon(Icons.code),
            );
          },
        ),
      ],
    );
  }
}
