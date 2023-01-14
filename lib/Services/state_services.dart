import 'dart:convert';

import 'package:code19_tracker/Models/world_state_model.dart';
import 'package:code19_tracker/Services/Utilites/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStateModel> fetchWorldStateRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      return throw Exception('error');
    }
  }
}
