import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:redes_av1/app/modules/home/controller/home_controller.dart';
import 'package:redes_av1/app/modules/home/page/components/crypt_container.dart';

class CypherHistory extends StatelessWidget {
  final HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(105)),
      child: Container(
        decoration: BoxDecoration(
          color: NeumorphicTheme.currentTheme(context).accentColor,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Histórico",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return CryptContainer(crypts: _homeController.crypts);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
