import 'dart:convert';

import 'package:cts_qr_wallet/models/tracker/tracker.dart';
import 'package:http/http.dart' as http;

abstract class TrackerInterface {
  Future<List<CovidTracker>> findAll([bool refresh]);
}

class TrackerRepository implements TrackerInterface {
  final List<CovidTracker> _tracker = [];
  @override
  Future<List<CovidTracker>> findAll([bool refresh = false]) async {
    if (refresh) {
      _tracker.clear();
    }
    final response =
        await http.get('https://southcotabato.ph/web/Home/CovidCasesDataTable');
    if (response.statusCode != 200) {
      throw response.body;
    }
    final _decode = jsonDecode(response.body);
    final data = _decode['data'];
    final list = (data as List).map((e) {
      return CovidTracker.fromJson(e);
    }).toList();
    _tracker.addAll(list);
    return _tracker;
  }
}
