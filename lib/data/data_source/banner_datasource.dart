import 'package:book_shop/data/model/banner.dart';
import 'package:book_shop/data/model/category.dart';
import 'package:book_shop/util/api_exeption.dart';
import 'package:dio/dio.dart';

import '../../di/di.dart';

abstract class IBannerDataSource {
  Future<List<BannerCampain>> getBanners();
}

class BannerRemoteDatasource extends IBannerDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<BannerCampain>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerCampain>(
              (jsomObject) => BannerCampain.fromJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }
}
