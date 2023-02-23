import 'package:book_shop/bloc/product/product_event.dart';
import 'package:book_shop/data/model/product_image.dart';
import 'package:book_shop/data/model/product_varient.dart';
import 'package:book_shop/data/model/variant_type.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVariant>> productVarient;

  ProductDetailResponseState(this.productImages, this.productVarient);
}
