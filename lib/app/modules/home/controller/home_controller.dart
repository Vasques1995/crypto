import 'package:encrypt/encrypt.dart' as encryptPackage;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:redes_av1/app/core/enum/enum_cipher.dart';
import 'package:redes_av1/app/core/model/crypt_model.dart';
import 'package:redes_av1/app/modules/home/page/components/crypt_title.dart';
import 'package:flutter_des/flutter_des.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  TextEditingController keyController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @observable
  Cypher cypherEnum = Cypher.CESAR;

  @observable
  ObservableList<CryptModel> crypts = ObservableList<CryptModel>();

  @action
  changeCypher(Cypher cypherSelected) {
    this.cypherEnum = cypherSelected;
  }

  @action
  encrypt() async {
    String key = keyController.text;
    String message = messageController.text;
    String result;
    bool isEncrypt = true;
    switch (cypherEnum) {
      case Cypher.CESAR:
        result = cesarEncrypt(key, message);
        break;
      case Cypher.XOR:
        result = xorEncrypt(key, message);
        break;
      case Cypher.SDES:
        result = sdesEncrypt(key, message);
        break;
      case Cypher.DES:
        String aux = await desEncrypt(key, message);
        result = aux;
        break;
      case Cypher.AES:
        result = aesEncrypt(key, message);
        break;
    }
    CryptModel auxCrypt =
        CryptModel(cypherEnum, key, message, result, isEncrypt);
    crypts.add(auxCrypt);
    crypts = crypts;
  }

  @action
  decrypt() async {
    String key = keyController.text;
    String message = messageController.text;
    String result;
    bool isEncrypt = false;
    switch (cypherEnum) {
      case Cypher.CESAR:
        result = cesarDecrypt(key, message);
        break;
      case Cypher.XOR:
        result = xorDecrypt(key, message);
        break;
      case Cypher.SDES:
        result = sdesDecrypt(key, message);
        break;
      case Cypher.DES:
        String aux = await desDecrypt(key, message);
        result = aux;
        break;
      case Cypher.AES:
        result = aesDecrypt(key, message);
        break;
    }
    CryptModel auxCrypt =
        CryptModel(cypherEnum, key, message, result, isEncrypt);
    crypts.add(auxCrypt);
    crypts = crypts;
  }

  @computed
  String get cypherTitle {
    switch (cypherEnum) {
      case Cypher.CESAR:
        return "Cifra de Cesar";
        break;
      case Cypher.XOR:
        return "Cifra de XOR";
        break;
      case Cypher.SDES:
        return "Cifra de SDES";
        break;
      case Cypher.DES:
        return "Cifra de DES";
        break;
      case Cypher.AES:
        return "Cifra de AES";
        break;
      default:
        return "Cifra do Bug";
    }
  }

  @computed
  CryptTitle get cypherTitleWidget {
    return CryptTitle(cypherTitle: cypherTitle);
  }

  String cesarEncrypt(String key, String message) {
    String encryptedText = "";
    int intKey = int.parse(key);
    for (int r = 0; r < message.length; r++) {
      String encryptedChar =
          String.fromCharCode(message.runes.toList()[r] + intKey);
      encryptedText += encryptedChar;
    }
    return encryptedText;
  }

  String cesarDecrypt(String key, String message) {
    String plainText = "";
    int intKey = int.parse(key);
    for (int r = 0; r < message.length; r++) {
      String encryptedChar =
          String.fromCharCode(message.runes.toList()[r]- intKey);
      plainText += encryptedChar;
    }
    return plainText;
  }

  String xorEncrypt(String key, String message) {
    String encryptedText = "";
    //TODO Repetir a chave até ficar do tamanho da mensagem
    if (key.length < message.length) {}
    // String repeatedKey =

    //M: 1001
    //K: 1010
    //R: 0011
    //Pego caractere por caractere e faço o XOR com a chave
    // for (int r = 0; r < message.length; r++) {
    //   int aux = message.codeUnitAt(r);
    //   int encryptedCharCode = aux ^ intKey;
    //   String encryptedChar = String.fromCharCode(encryptedCharCode);
    //   encryptedText += encryptedChar;
    // }
    return encryptedText;
  }

  String xorDecrypt(String key, String message) {
    String plainText = "";
    int intKey = int.parse(key);
    for (int r = 0; r < message.length; r++) {
      String encryptedChar =
          String.fromCharCode(message.codeUnitAt(r) - intKey);
      plainText += encryptedChar;
    }
    return plainText;
  }

  String sdesEncrypt(String key, String message) {
    String encryptedText = "";
    int intKey = int.parse(key);
  }

  String sdesDecrypt(String key, String message) {}

  Future desEncrypt(String key, String message) {
    return FlutterDes.encryptToBase64(message, key, iv: "12345678");
  }

  Future<String> desDecrypt(String key, String message) async {
    String decrypted =
        await FlutterDes.decryptFromBase64(message, key, iv: "12345678");
    return decrypted;
  }

  String aesEncrypt(String key, String message) {
    key = key.padLeft(32);
    encryptPackage.Key aesKey = encryptPackage.Key.fromUtf8(key);
    Encrypter encrypter =
        Encrypter(AES(aesKey, mode: encryptPackage.AESMode.cbc));
    IV iv = IV.fromLength(16);
    return encrypter.encrypt(message, iv: iv).base64;
  }

  String aesDecrypt(String key, String message) {
    key = key.padLeft(32);
    encryptPackage.Key aesKey = encryptPackage.Key.fromUtf8(key);
    Encrypter encrypter =
        Encrypter(AES(aesKey, mode: encryptPackage.AESMode.cbc));
    IV iv = IV.fromLength(16);
    return encrypter.decrypt(encrypter.encrypt(message, iv: iv), iv: iv);
  }
}
