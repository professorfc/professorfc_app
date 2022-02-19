import 'dart:convert';

import 'package:flutter/services.dart';

class LoadMock {
  static Future<Map<String, dynamic>> fromAsset(String path) async {
    final data = await rootBundle.loadString("assets/mocks/$path");
    return jsonDecode(data);
  }
}
