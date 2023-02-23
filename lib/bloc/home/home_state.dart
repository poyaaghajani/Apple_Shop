import 'package:book_shop/data/model/banner.dart';
import 'package:book_shop/data/model/category.dart';
import 'package:book_shop/data/model/product.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  Either<String, List<Category>> categoryList;
  Either<String, List<Product>> productList;
  Either<String, List<Product>> hotestProductList;
  Either<String, List<Product>> bestSellerProductList;

  HomeRequestSuccessState(
    this.bannerList,
    this.categoryList,
    this.productList,
    this.hotestProductList,
    this.bestSellerProductList,
  );
}
