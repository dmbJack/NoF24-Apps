import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:not24/models/articles.dart';
import 'package:not24/services/api_services.dart';

class DataRepository extends ChangeNotifier {
  final ApiServices services = ApiServices();
  final List<Articles> _articleSection = [];
  
  List<Articles> get getInfoSection => _articleSection;

  Future<void> getNewsSection({required String sectionName}) async {
    _articleSection.clear();
    final List<Articles> _data;
    try {
      _data = await services.getNewsSection(sectionName: sectionName);
      _articleSection.addAll(_data);
      notifyListeners();
    // ignore: unused_catch_clause
    } on Response catch (e) {
      throw Response;
    }
  }
}
