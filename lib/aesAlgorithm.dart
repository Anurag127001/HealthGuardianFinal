// import 'package:encrypt/encrypt.dart' as encrypt;
//
// class MyEncryptionDecryption {
//   // For AES Encryption/Decryption
//   static final key = encrypt.Key.fromUtf8('84080710969325581510840807109693'); // Set your encryption key here
//   static final iv = encrypt.IV.fromLength(16);
//   static final encrypter = encrypt.Encrypter(encrypt.AES(key));
//
//   static encryptAES(text) {
//     final encrypted = encrypter.encrypt(text, iv: iv);
//
//     print(encrypted.bytes);
//     print(encrypted.base16);
//     print(encrypted.base64);
//     return encrypted;
//   }
//
//   static decryptAES(text) {
//     // Use the same key for decryption
//     final decrypter = encrypt.Encrypter(encrypt.AES(key)); // Use the same key for decryption
//     final decrypted = decrypter.decrypt(text, iv: iv);
//     print(decrypted);
//     return decrypted;
//   }
// }
//
//
//
//



// import 'package:encrypt/encrypt.dart' as encrypt;
//
// class AESAlgorithm {
//   static final key = encrypt.Key.fromLength(32); // 256-bit key
//   static final iv = encrypt.IV.fromLength(16); // 128-bit IV
//
//   static String encryptData(String plainText) {
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//     return encrypted.base64;
//   }
//
//   static String decryptData(String encryptedText) {
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
//     return decrypted;
//   }
// }   this is running code


import 'package:encrypt/encrypt.dart' as encrypt;

class AESAlgorithm {
  static final key = encrypt.Key.fromUtf8('9999988888777776'); // 128-bit key
  static final iv = encrypt.IV.fromUtf8('0123456789abcdef'); // 128-bit IV

  static String encryptData(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decryptData(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}

