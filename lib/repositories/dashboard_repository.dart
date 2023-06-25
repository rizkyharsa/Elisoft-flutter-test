import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elisoft_flutter_test/constants/api_constant.dart';
import 'package:elisoft_flutter_test/models/dashboard/article.dart';

class DashboardRepository {
  final Dio dio = Dio();

  Future<List<ArticleElement>> getArticle() async {
    final response = await dio.get("$baseUrl/articles");
    if (response.statusCode == 200) {
      final List data = jsonDecode(jsonEncode(response.data['articles']));
      print(data);
      return data.map((e) => ArticleElement.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
