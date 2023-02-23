import 'package:book_shop/data/model/product.dart';
import 'package:dio/dio.dart';

import '../../di/di.dart';
import '../../util/api_exeption.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getHotest();
  Future<List<Product>> getBestSeller();
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProducts() async {
    try {
      var response = await _dio.get('collections/products/records');
      return response.data['items']
          .map<Product>((jsomObject) => Product.fromMapJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }

  @override
  Future<List<Product>> getHotest() async {
    try {
      Map<String, dynamic> queryParams = {'filter': 'popularity="Hotest"'};

      var response = await _dio.get(
        'collections/products/records',
        queryParameters: queryParams,
      );
      return response.data['items']
          .map<Product>((jsomObject) => Product.fromMapJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }

  @override
  Future<List<Product>> getBestSeller() async {
    try {
      Map<String, dynamic> queryParams = {'filter': 'popularity="Best Seller"'};

      var response = await _dio.get(
        'collections/products/records',
        queryParameters: queryParams,
      );
      return response.data['items']
          .map<Product>((jsomObject) => Product.fromMapJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }
}
