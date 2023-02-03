import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

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
                            'آیفون',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SM',
                              color: CustomColors.blueIndicator,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Image.asset(
                          'images/arrow_circle_back.png',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'SE آیفون 2022 ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 16,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                child: Container(
                  height: 284,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        child: Row(
                          children: [
                            Image.asset('images/rate_star.png'),
                            const SizedBox(width: 5),
                            const Text('4.6'),
                            const Spacer(),
                            Image.asset('images/unactive_fav_product.png'),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 18,
                        child: Image.asset('images/iphone1.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 184),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 32),
              sliver: SliverToBoxAdapter(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 44),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getColors(),
                        const SizedBox(height: 20),
                        _getInnerStorage(),
                        const SizedBox(height: 20),
                        _getProductDetail(),
                        const SizedBox(height: 38),
                        _getAddToBasketShop(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _getAddToBasketShop() {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 140,
              height: 47,
              decoration: BoxDecoration(
                color: CustomColors.blueIndicator,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              top: 5,
              child: ClipRRect(
                // ignore: sort_child_properties_last
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 53,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: const Center(
                      child: Text(
                        'افزودن سبد خرید',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SM',
                        ),
                      ),
                    ),
                  ),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
        const SizedBox(width: 26),
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 140,
              height: 47,
              decoration: BoxDecoration(
                color: CustomColors.green,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              top: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),

                // ignore: sort_child_properties_last
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 53,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 6,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 6),
                                child: Text(
                                  '%3',
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '17,000,000',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '16,500,000',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            'تومان',
                            style: TextStyle(
                              fontFamily: 'SM',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _getProductDetail() {
    return Column(
      children: [
        Container(
          height: 46,
          width: 304,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Text(
                  'مشخصات فنی:',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SM',
                  ),
                ),
                const Spacer(),
                const Text(
                  'مشاهده',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SM',
                    color: CustomColors.blueIndicator,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('images/icon_left_categroy.png')
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 46,
          width: 304,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Text(
                  ' توضیحات محصول:',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SM',
                  ),
                ),
                const Spacer(),
                const Text(
                  'مشاهده',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SM',
                    color: CustomColors.blueIndicator,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('images/icon_left_categroy.png')
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 46,
          width: 304,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Text(
                  ' نظرات کاربران:',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SM',
                  ),
                ),
                const SizedBox(width: 8),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xffB40B22),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      right: 15,
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 45,
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 60,
                      child: Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            '+10',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SB',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'مشاهده',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SM',
                    color: CustomColors.blueIndicator,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('images/icon_left_categroy.png')
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _getInnerStorage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'انتخاب حافظه داخلی',
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: 26,
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: CustomColors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text(
                '128',
                style: TextStyle(fontFamily: 'SM'),
              )),
            ),
            const SizedBox(width: 10),
            Container(
              height: 26,
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: CustomColors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text(
                '256',
                style: TextStyle(fontFamily: 'SM'),
              )),
            ),
            const SizedBox(width: 10),
            Container(
              height: 26,
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: CustomColors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text(
                '512',
                style: TextStyle(fontFamily: 'SM'),
              )),
            ),
          ],
        ),
      ],
    );
  }

  Column _getColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'انتخاب رنگ',
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: 26,
              width: 77,
              decoration: BoxDecoration(
                color: const Color(0xff171E27),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: const Color(0xffB40B22),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
