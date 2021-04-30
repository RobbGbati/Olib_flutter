import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Utils {
  static final storage = new FlutterSecureStorage();

  // -------------------------------------------------------------------------------------
  static Future<bool> connected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  // --------------------------------------
  showSnackBAr(String message) {
    return SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.blue[900],
      duration: Duration(seconds: 5)
    );
  }

}