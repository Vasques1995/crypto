import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:redes_av1/app/modules/home/page/components/cypher_history.dart';
import 'package:redes_av1/app/modules/home/page/components/side_navbar.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: SideNavbar(
                            homeController: controller,
                          )),
                      Expanded(child: CypherHistory()),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(18, 20, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Observer(
                          builder: (_) {
                            return controller.cypherTitleWidget;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: controller.keyController,
                                  decoration: InputDecoration(
                                      labelText: "Chave",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () {
                                    controller.encrypt();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.21,
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    decoration: BoxDecoration(
                                      color:
                                          NeumorphicTheme.currentTheme(context)
                                              .accentColor,
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(15),
                                          right: Radius.circular(0)),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.enhanced_encryption,
                                            color:  Colors.white,
                                          ),
                                          Text("encrypt", style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: controller.messageController,
                                  decoration: InputDecoration(
                                      labelText: 'Mensagem',
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: InkWell(
                                  onTap: () {
                                    controller.decrypt();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.21,
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(15),
                                            right: Radius.circular(0)),
                                        border: Border(
                                          left: BorderSide(
                                              color:
                                                  NeumorphicTheme.currentTheme(
                                                          context)
                                                      .accentColor),
                                          top: BorderSide(
                                              color:
                                                  NeumorphicTheme.currentTheme(
                                                          context)
                                                      .accentColor),
                                          bottom: BorderSide(
                                              color:
                                                  NeumorphicTheme.currentTheme(
                                                          context)
                                                      .accentColor),
                                          right: BorderSide(
                                              color:
                                              NeumorphicTheme.currentTheme(
                                                  context)
                                                  .accentColor
                                          )
                                        )),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.no_encryption,
                                            color:  NeumorphicTheme.currentTheme(
                                                context)
                                                .accentColor,
                                          ),
                                          Text("decrypt", style: TextStyle(
                                            color:  NeumorphicTheme.currentTheme(
                                                context)
                                                .accentColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
