import 'package:book_shop/bloc/product/product_bloc.dart';
import 'package:book_shop/data/model/product.dart';
import 'package:book_shop/screens/product_detail_screen.dart';
import 'package:book_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider(
                create: (context) => ProductBloc(),
                child: ProductDetailScreen(product),
              );
            },
          ),
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width / 2.6,
                  height: height / 8.5,
                ),
                SizedBox(
                  width: 98,
                  height: 98,
                  child: CachedImage(
                    imageUrl: product.thumbnail,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 0,
                  child: SizedBox(
                    width: 23,
                    height: 23,
                    child: Image.asset('images/active_fav_product.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      child: Text(
                        '${product.persent!.round().toString()} %',
                        style: const TextStyle(
                          fontFamily: 'sm',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: 53,
                  decoration: const BoxDecoration(
                    color: CustomColors.blueIndicator,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blueIndicator,
                        blurRadius: 25,
                        spreadRadius: -14,
                        offset: Offset(0.0, 15.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'تومان',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.price.toString(),
                              style: const TextStyle(
                                fontFamily: 'SM',
                                color: Colors.white,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              product.realPrice.toString(),
                              style: const TextStyle(
                                fontFamily: 'SM',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 22,
                          child:
                              Image.asset('images/icon_right_arrow_cricle.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
