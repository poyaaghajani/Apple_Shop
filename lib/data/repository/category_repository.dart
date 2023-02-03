import 'package:book_shop/data/data_source/category_datasource.dart';
import 'package:book_shop/data/model/category.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/util/api_exeption.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource _datasource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getCategories();
      return right(response);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'خطا محتوایی وجود ندارد');
    }
  }
}
