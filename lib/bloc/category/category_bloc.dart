import 'package:bloc/bloc.dart';
import 'package:book_shop/bloc/category/category_event.dart';
import 'package:book_shop/bloc/category/category_state.dart';
import 'package:book_shop/data/repository/category_repository.dart';
import 'package:book_shop/di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator.get();
  CategoryBloc() : super(CategoryInitiateState()) {
    on<CategoryRequestEvent>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
