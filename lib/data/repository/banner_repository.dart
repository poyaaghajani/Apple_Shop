import 'package:book_shop/data/data_source/banner_datasource.dart';
import 'package:book_shop/data/model/banner.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/util/api_exeption.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampain>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSource _datasource = locator.get();
  @override
  Future<Either<String, List<BannerCampain>>> getBanners() async {
    try {
      var response = await _datasource.getBanners();
      return right(response);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطا محتوایی وجود ندارد');
    }
  }
}
