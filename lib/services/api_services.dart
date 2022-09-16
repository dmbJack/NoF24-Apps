import 'package:dio/dio.dart';
import 'package:not24/models/articles.dart';
import 'package:not24/services/api_base.dart';
import 'package:not24/services/api_key.dart';

class ApiServices {
  final dio = Dio();
  Future<Response> getData({Map<String, dynamic>? params}) async {
    Map<String, dynamic> query = {
      'token': ApiKey.key,
      'lang': 'fr',
      // 'q': 'tout'
    };
    if (params != null) {
      query.addAll(params);
    }
    
    final Response response =
        await dio.get(ApiBase.urlTop, queryParameters: query);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }


  Future<List<Articles>> getNewsSection({required String sectionName}) async {
    Response response = await getData(params: {'topic': sectionName});
    if (response.statusCode==200) {
      List _data = response.data['articles'] as List;
      List<Articles> articles=[];
      for (var i = 0; i < _data.length; i++) {
        articles.add(Articles.fromJson(_data[i]));
      }
      return articles;
    }else{
      throw response;
    }
  }
}
