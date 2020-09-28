import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:redes_av1/app/core/model/crypt_model.dart';

class CryptWidget extends StatelessWidget {
  final CryptModel cryptModel;

  const CryptWidget({Key key, this.cryptModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cryptModel.cypher.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: NeumorphicTheme.of(context).current.accentColor,
                      fontSize: 16),
                ),
                Text(cryptModel.createdAt)
              ],
            ),
            Text(
              "Operação: ${(cryptModel.isEnrypt) ? "encrypt" : "decrypt"}",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Chave: ${cryptModel.key}"),
            Text("Mensagem: ${cryptModel.message}"),
            Text("Resultado: ${cryptModel.result}")
          ],
        ),
      ),
    );
  }
}
