import 'package:book_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, bottom: 32, top: 10),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Image.asset('images/icon_apple_blue.png'),
                        const Expanded(
                          child: Text(
                            'پرفروش ترین ها',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SM',
                              color: CustomColors.blueIndicator,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 20,
                  (context, index) {
                    return const ProductItem();
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.8,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
