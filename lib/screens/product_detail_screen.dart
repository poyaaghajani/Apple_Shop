import 'dart:ui';

import 'package:book_shop/bloc/product/product_bloc.dart';
import 'package:book_shop/bloc/product/product_event.dart';
import 'package:book_shop/bloc/product/product_state.dart';
import 'package:book_shop/data/model/product.dart';
import 'package:book_shop/data/model/product_image.dart';
import 'package:book_shop/data/model/product_varient.dart';
import 'package:book_shop/data/model/variant_type.dart';
import 'package:book_shop/data/model/varient.dart';
import 'package:book_shop/data/repository/product_detail_repository.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(ProductInitEvent(widget.product.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 11,
                        right: width / 11,
                        bottom: 32,
                        top: height / 120),
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
                              color: CustomColors.blueIndicator,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (state is ProductLoadingState) ...{
                  SliverToBoxAdapter(
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: CustomColors.blueIndicator,
                        size: 35,
                      ),
                    ),
                  )
                } else ...{
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
                  if (state is ProductDetailResponseState) ...[
                    state.productImages.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (productImageList) {
                      return GalleryWidget(
                          widget.product.thumbnail, productImageList);
                    })
                  ],
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
                              if (state is ProductDetailResponseState) ...[
                                state.productVarient.fold(
                                  (l) {
                                    return Text(l);
                                  },
                                  (productVariantList) {
                                    return VariantContainerGenerator(
                                        productVariantList);
                                  },
                                )
                              ],
                              const SizedBox(height: 20),
                              // _getInnerStorage(),
                              _getProductDetail(),
                              const SizedBox(height: 38),
                              _getAddToBasketShop(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                },
              ],
            ),
          );
        },
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
        const SizedBox(
          width: 45,
        ),
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 46,
          width: width / 1.2,
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
          width: width / 1.2,
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
          width: width / 1.2,
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
}

class VariantContainerGenerator extends StatelessWidget {
  List<ProductVariant> productVariantList;

  VariantContainerGenerator(
    this.productVariantList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var productVariant in productVariantList) ...{
          if (productVariant.variantList.isNotEmpty) ...{
            VariantGeneratorChild(productVariant)
          }
        }
      ],
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  ProductVariant productVariant;
  VariantGeneratorChild(this.productVariant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariant.variantType.title!,
            style: const TextStyle(fontFamily: 'SB', fontSize: 12),
          ),
          const SizedBox(height: 10),
          if (productVariant.variantType.type == VarientTypeEnum.COLOR) ...{
            ColorVariantList(productVariant.variantList)
          },
          if (productVariant.variantType.type == VarientTypeEnum.STORAGE) ...{
            StorageVariantList(productVariant.variantList)
          },
        ],
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productImageList;
  String? defaultProductThumnail;
  int selectedItem = 0;
  GalleryWidget(
    this.defaultProductThumnail,
    this.productImageList, {
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
        child: Container(
          height: height / 3,
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
                    const Text(
                      '4.6',
                      style: TextStyle(
                        fontFamily: 'SM',
                      ),
                    ),
                    const Spacer(),
                    Image.asset('images/unactive_fav_product.png'),
                  ],
                ),
              ),
              Positioned(
                top: 18,
                child: SizedBox(
                  height: 149,
                  width: 120,
                  child: CachedImage(
                    imageUrl: (widget.productImageList.isEmpty)
                        ? widget.defaultProductThumnail
                        : widget.productImageList[widget.selectedItem].imageUrl,
                  ),
                ),
              ),
              if (widget.productImageList.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 184),
                  child: SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: widget.productImageList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.selectedItem = index;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              padding: const EdgeInsets.all(4),
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CachedImage(
                                radius: 10,
                                imageUrl:
                                    widget.productImageList[index].imageUrl,
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class ColorVariantList extends StatefulWidget {
  List<Variant> variantList;
  ColorVariantList(this.variantList, {super.key});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variantList.length,
        itemBuilder: (context, index) {
          String variantColor = 'ff${widget.variantList[index].value}';
          int hexColor = int.parse(variantColor, radix: 16);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Color(hexColor),
                borderRadius: BorderRadius.circular(8),
              ),
              width: (selectedIndex == index) ? 50 : 26,
            ),
          );
        },
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  List<Variant> storageVariantList;
  StorageVariantList(this.storageVariantList, {super.key});

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.storageVariantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 74,
              decoration: BoxDecoration(
                color: Colors.white,
                border: (selectedIndex == index)
                    ? Border.all(color: CustomColors.blueIndicator, width: 2)
                    : Border.all(color: CustomColors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  widget.storageVariantList[index].value!,
                  style: const TextStyle(fontFamily: 'SM'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
