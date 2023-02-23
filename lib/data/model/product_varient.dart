import 'package:book_shop/data/model/variant_type.dart';
import 'package:book_shop/data/model/varient.dart';

class ProductVariant {
  VariantType variantType;
  List<Variant> variantList;

  ProductVariant(this.variantType, this.variantList);
}
