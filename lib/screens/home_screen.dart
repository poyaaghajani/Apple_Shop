import 'package:book_shop/bloc/home/home_bloc.dart';
import 'package:book_shop/bloc/home/home_event.dart';
import 'package:book_shop/bloc/home/home_state.dart';
import 'package:book_shop/data/model/banner.dart';
import 'package:book_shop/data/model/category.dart';
import 'package:book_shop/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/constants.dart';
import '../widgets/banner_slider.dart';
import '../widgets/category_icon_item_list.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const getSearchBox(),
                if (state is HomeLoadingState) ...{
                  SliverToBoxAdapter(
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: CustomColors.blueIndicator,
                        size: 35,
                      ),
                    ),
                  ),
                } else ...{
                  if (state is HomeRequestSuccessState) ...[
                    state.bannerList.fold((exceptionMessage) {
                      return const SliverToBoxAdapter(
                        child: Text(''),
                      );
                    }, (listBanners) {
                      return getBanners(listBanners);
                    }),
                  ],
                  const getCategory(),
                  if (state is HomeRequestSuccessState) ...[
                    state.categoryList.fold((exceptionMessage) {
                      return SliverToBoxAdapter(
                        child: Text(exceptionMessage),
                      );
                    }, (categoryList) {
                      return getCategoryList(categoryList);
                    }),
                  ],
                  const getBestSellers(),
                  if (state is HomeRequestSuccessState) ...[
                    state.bestSellerProductList.fold((exceptionMessage) {
                      return SliverToBoxAdapter(
                        child: Text(exceptionMessage),
                      );
                    }, (productList) {
                      return getBestSellersList(productList);
                    }),
                  ],
                  const getMostView(),
                  if (state is HomeRequestSuccessState) ...[
                    state.hotestProductList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(exceptionMessage),
                        );
                      },
                      (productList) {
                        return getMostViewList(productList);
                      },
                    ),
                  ],
                },
                SliverPadding(padding: EdgeInsets.only(bottom: 10)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class getMostViewList extends StatelessWidget {
  List<Product> productList;
  getMostViewList(
    this.productList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: width / 15),
        child: SizedBox(
          height: 210,
          child: ListView.builder(
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ProductItem(productList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class getMostView extends StatelessWidget {
  const getMostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: width / 15,
          right: width / 15,
          bottom: height / 45,
          top: height / 25,
        ),
        child: Row(
          children: [
            const Text(
              ' پربازدید ترین ها',
              style: TextStyle(
                color: CustomColors.grey,
                fontSize: 12,
                fontFamily: 'SB',
              ),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                color: CustomColors.blueIndicator,
                fontFamily: 'SB',
              ),
            ),
            const SizedBox(width: 10),
            Image.asset('images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class getBestSellersList extends StatelessWidget {
  List<Product> productList;
  getBestSellersList(
    this.productList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: width / 15),
        child: SizedBox(
          height: 210,
          child: ListView.builder(
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ProductItem(productList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class getBestSellers extends StatelessWidget {
  const getBestSellers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: width / 15,
          right: width / 15,
          bottom: height / 45,
          top: height / 40,
        ),
        child: Row(
          children: [
            const Text(
              ' پرفروش ترین ها',
              style: TextStyle(
                color: CustomColors.grey,
                fontSize: 12,
                fontFamily: 'SB',
              ),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                color: CustomColors.blueIndicator,
                fontFamily: 'SB',
              ),
            ),
            const SizedBox(width: 10),
            Image.asset('images/icon_left_categroy.png'),
          ],
        ),
      ),
    );
  }
}

class getCategoryList extends StatelessWidget {
  List<Category> listCategory;
  getCategoryList(
    this.listCategory, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: width / 15),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: listCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CategoryIconItemList(listCategory[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class getCategory extends StatelessWidget {
  const getCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
            right: width / 15, bottom: height / 45, top: height / 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 10),
            Text(
              ' دسته بندی',
              style: TextStyle(
                color: CustomColors.blueIndicator,
                fontFamily: 'SB',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getBanners extends StatelessWidget {
  List<BannerCampain> bannerCampain;
  getBanners(
    this.bannerCampain, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(bannerCampain),
    );
  }
}

class getSearchBox extends StatelessWidget {
  const getSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
            left: width / 11, right: width / 11, bottom: 32, top: height / 120),
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
                Image.asset('images/icon_search.png'),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'جست و جوی محصولات',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: CustomColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                Image.asset('images/icon_apple_blue.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
