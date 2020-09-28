import 'package:redes_av1/app/core/enum/enum_cipher.dart';

class CryptModel {
  Cypher cypher;
  String key;
  String message;
  String result;
  bool isEnrypt;
  String createdAt;

  CryptModel(this.cypher, this.key, this.message, this.result, this.isEnrypt){
    DateTime now = DateTime.now();
    createdAt = "${now.minute}: ${now.second}";
  }

}
