abstract class ProductEvent {}

class ProductInitEvent extends ProductEvent {
  String productId;
  ProductInitEvent(this.productId);
}
