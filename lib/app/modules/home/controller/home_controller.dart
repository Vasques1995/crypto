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
    String result = "Resultado do bug :D";
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
    String result = "Resultado do bug :D";
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
          String.fromCharCode(message.runes.toList()[r] - intKey);
      plainText += encryptedChar;
    }
    return plainText;
  }

  String xorEncrypt(String key, String message) {
    String encryptedText = "";
    if (key.length < message.length) {
      key = key.padRight(message.length, key);
    }
    for (int r = 0; r < message.length; r++) {
      int aux = message[r].runes.toList()[0];
      int encryptedCharCode = aux ^ int.parse(key[r]);
      String encryptedChar = String.fromCharCode(encryptedCharCode);
      encryptedText += encryptedChar;
    }
    return encryptedText;
  }

  String xorDecrypt(String key, String message) {
    String plainText = "";
    if (key.length < message.length) {
      key = key.padRight(message.length, key);
    }
    for (int r = 0; r < message.length; r++) {
      int aux = message[r].runes.toList()[0];
      int decryptedCharCode = aux ^ int.parse(key[r]);
      String encryptedChar = String.fromCharCode(decryptedCharCode);
      plainText += encryptedChar;
    }
    return plainText;
  }

  String sdesEncrypt(String key, String message) {
    // String encryptedText = message.padRight(8);
    // List<String> generatedKeys = generateSDESKeys(key);
    // String key1 = generatedKeys[0];
    // String key2 = generatedKeys[1];
    // String firstPermutation = "";
    // String leftPermuted = "";
    // String rightPermuted = "";
    // String firstRightXorWithK1 = "";
    // //IP 8
    // //1° Passo = Permutação inicial -> 2, 6, 3, 1, 4, 8, 5, 7
    // firstPermutation += key[2];
    // firstPermutation += key[6];
    // firstPermutation += key[3];
    // firstPermutation += key[1];
    // firstPermutation += key[4];
    // firstPermutation += key[8];
    // firstPermutation += key[5];
    // firstPermutation += key[7];
    // String leftSide = encryptedText.substring(0, 4);
    // String rightSide = encryptedText.substring(4);
    // //2° Passo = Expand and Permutate Right Side
    // rightPermuted += rightSide[4];
    // rightPermuted += rightSide[1];
    // rightPermuted += rightSide[2];
    // rightPermuted += rightSide[3];
    // rightPermuted += rightSide[2];
    // rightPermuted += rightSide[3];
    // rightPermuted += rightSide[4];
    // rightPermuted += rightSide[1];
    // //3° Passo = XOR rightPermuted com k1
    // for (int r = 0; r < key1.length; r++) {
    //   firstRightXorWithK1 += (int.parse(key1[r]) ^ int.parse(rightPermuted[r])).toString();
    // }
    //I give up :D
    return 'bug';
  }

  String sdesDecrypt(String key, String message) {
    return 'bug';
  }

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
    String decrypted =
        encrypter.decrypt(encryptPackage.Encrypted.from64(message), iv: iv);
    return decrypted;
  }

  String leftRotate(String str, int d) {
    String ans = str.substring(d) + str.substring(0, d);
    return ans;
  }

  String rightRotate(String str, int d) {
    return leftRotate(str, str.length - d);
  }

  List<String> generateSDESKeys(String key) {
    String firstPermutation = "";
    String key1 = "";
    String key2 = "";
    //Chave de 10 bits
    //Exemplo: (1010000010)
    key = key.padRight(10, key);
    //1° Passo = Permutação inicial -> 3, 5, 2, 7, 4, 10, 1, 9, 8, 6
    firstPermutation += key[3];
    firstPermutation += key[5];
    firstPermutation += key[2];
    firstPermutation += key[7];
    firstPermutation += key[4];
    firstPermutation += key[10];
    firstPermutation += key[1];
    firstPermutation += key[9];
    firstPermutation += key[8];
    firstPermutation += key[6];
    //1 Permutação: (1000001100)
    //2° Passo = Divisão em duas partes
    String leftFirstPermutation = firstPermutation.substring(0, 5);
    String rightFirstPermutation = firstPermutation.substring(5);
    //Corte: (10000 01100)
    //3° Passo = Left Circular Rotation 1 nas partes
    String left1PRotated = leftRotate(leftFirstPermutation, 1);
    String right1PRotated = leftRotate(rightFirstPermutation, 1);
    String firstPRotated = left1PRotated + right1PRotated;
    //Rotação: (00001 11000)
    //4° Passo = P8 -> 6, 3, 7, 4, 8, 5, 10, 9
    key1 += firstPRotated[6];
    key1 += firstPRotated[3];
    key1 += firstPRotated[7];
    key1 += firstPRotated[4];
    key1 += firstPRotated[8];
    key1 += firstPRotated[5];
    key1 += firstPRotated[10];
    key1 += firstPRotated[9];
    //P8: (10100100)
    //5° Passo = Left Circular Rotation 2 nas partes rodadas
    String left2PRotated = leftRotate(left1PRotated, 2);
    String right2PRotated = leftRotate(right1PRotated, 2);
    String secondPRotated = left2PRotated + right2PRotated;
    //2 Rotação: (00100 00011)
    //5° Passo = P8 na segunda rodada
    key2 += secondPRotated[6];
    key2 += secondPRotated[3];
    key2 += secondPRotated[7];
    key2 += secondPRotated[4];
    key2 += secondPRotated[8];
    key2 += secondPRotated[5];
    key2 += secondPRotated[10];
    key2 += secondPRotated[9];
    return [key1, key2];
  }
}
