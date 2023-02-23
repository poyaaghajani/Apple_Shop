import 'package:bloc/bloc.dart';
import 'package:book_shop/bloc/product/product_event.dart';
import 'package:book_shop/bloc/product/product_state.dart';
import 'package:book_shop/data/repository/product_detail_repository.dart';
import 'package:book_shop/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepository _productDetailRepository = locator.get();
  ProductBloc() : super(ProductInitState()) {
    on<ProductInitEvent>((event, emit) async {
      emit(ProductLoadingState());

      var productImage =
          await _productDetailRepository.getProductImage(event.productId);
      var productVarient = await _productDetailRepository.getProductVariant();

      emit(ProductDetailResponseState(
        productImage,
        productVarient,
      ));
    });
  }
}
