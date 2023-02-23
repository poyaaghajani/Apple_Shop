import 'package:book_shop/data/data_source/product_detail_datasource.dart';
import 'package:book_shop/data/model/product_image.dart';
import 'package:book_shop/data/model/product_varient.dart';
import 'package:book_shop/data/model/variant_type.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/util/api_exeption.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<ProductImage>>> getProductImage(String productId);
  Future<Either<String, List<VariantType>>> getVarientType();
  Future<Either<String, List<ProductVariant>>> getProductVariant();
}

class ProductDetailRepository extends IProductDetailRepository {
  @override
  Future<Either<String, List<ProductImage>>> getProductImage(
      String productId) async {
    final IProductDetailDatasource datasource = locator.get();

    try {
      var response = await datasource.getGallery(productId);
      return right(response);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطا محتوایی وجود ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVarientType() async {
    final IProductDetailDatasource datasource = locator.get();

    try {
      var response = await datasource.getVarientType();
      return right(response);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطا محتوایی وجود ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariant() async {
    final IProductDetailDatasource datasource = locator.get();

    try {
      var response = await datasource.getProdutVariant();
      return right(response);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطا محتوایی وجود ندارد');
    }
  }
}
