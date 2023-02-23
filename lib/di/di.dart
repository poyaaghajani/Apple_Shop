import 'package:book_shop/data/data_source/authentication_datasource.dart';
import 'package:book_shop/data/data_source/banner_datasource.dart';
import 'package:book_shop/data/data_source/category_datasource.dart';
import 'package:book_shop/data/data_source/product_datasource.dart';
import 'package:book_shop/data/data_source/product_detail_datasource.dart';
import 'package:book_shop/data/repository/authentication_repository.dart';
import 'package:book_shop/data/repository/banner_repository.dart';
import 'package:book_shop/data/repository/category_repository.dart';
import 'package:book_shop/data/repository/product_detail_repository.dart';
import 'package:book_shop/data/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getitInit() async {
  //components

  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //dataSources
  locator
      .registerFactory<IAuthenticationDataSource>(() => AuthenticationRemote());

  locator
      .registerFactory<ICategoryDataSource>(() => CategoryRemoteDatasource());

  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDatasource());

  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());

  locator.registerFactory<IProductDetailDatasource>(
      () => ProductDetailDatasource());

  //repositorys
  locator.registerFactory<IAuthenticationRepository>(
      () => AuthenticationRepository());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());

  locator.registerFactory<IBannerRepository>(() => BannerRepository());

  locator.registerFactory<IProductRepository>(() => ProductRepository());

  locator.registerFactory<IProductDetailRepository>(
      () => ProductDetailRepository());
}
