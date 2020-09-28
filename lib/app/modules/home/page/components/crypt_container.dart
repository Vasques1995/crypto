import 'package:flutter/material.dart';
import 'package:redes_av1/app/core/model/crypt_model.dart';
import 'package:redes_av1/app/modules/home/page/components/crypt_widget.dart';

class CryptContainer extends StatelessWidget {
  final List<CryptModel> crypts;

  const CryptContainer({Key key, this.crypts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: crypts.length,
      itemBuilder: (BuildContext context, int index) {
        print("Buildando ListTile: $index");
        return CryptWidget(
          cryptModel: crypts[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 15,
        );
      },
    );
  }
}
