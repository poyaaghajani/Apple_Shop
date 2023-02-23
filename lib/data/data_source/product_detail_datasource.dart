import 'package:book_shop/data/model/product_image.dart';
import 'package:book_shop/data/model/product_varient.dart';
import 'package:book_shop/data/model/variant_type.dart';
import 'package:book_shop/data/model/varient.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/util/api_exeption.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailDatasource {
  Future<List<ProductImage>> getGallery(String productId);
  Future<List<VariantType>> getVarientType();
  Future<List<Variant>> getVariant();
  Future<List<ProductVariant>> getProdutVariant();
}

class ProductDetailDatasource extends IProductDetailDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImage>> getGallery(String productId) async {
    try {
      Map<String, dynamic> queryParams = {'filter': 'product_id="$productId"'};

      var response = await _dio.get(
        'collections/gallery/records',
        queryParameters: queryParams,
      );
      return response.data['items']
          .map<ProductImage>((jsomObject) => ProductImage.fromJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }

  @override
  Future<List<VariantType>> getVarientType() async {
    try {
      var response = await _dio.get('collections/variants_type/records');

      return response.data['items']
          .map<VariantType>((jsomObject) => VariantType.fromMapJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, dynamic> queryParams = {
        'filter': 'product_id="0tc0e5ju89x5ogj"'
      };
      var response = await _dio.get(
        'collections/variants/records',
        queryParameters: queryParams,
      );

      return response.data['items']
          .map<Variant>((jsomObject) => Variant.fromMapJson(jsomObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknow error');
    }
  }

  @override
  Future<List<ProductVariant>> getProdutVariant() async {
    var varientTypeList = await getVarientType();
    var variantList = await getVariant();

    List<ProductVariant> productVariantList = [];

    for (var variantType in varientTypeList) {
      var finalVariantList = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();

      productVariantList.add(ProductVariant(variantType, finalVariantList));
    }

    return productVariantList;
  }
}
