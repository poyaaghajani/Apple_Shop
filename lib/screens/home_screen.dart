import 'package:book_shop/bloc/home/home_bloc.dart';
import 'package:book_shop/bloc/home/home_event.dart';
import 'package:book_shop/bloc/home/home_state.dart';
import 'package:book_shop/data/model/banner.dart';
import 'package:book_shop/data/repository/banner_repository.dart';
import 'package:book_shop/screens/product_detail_screen.dart';
import 'package:book_shop/widgets/banner_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const getSearchBox(),
                if (state is HomeLoadingState) ...[
                  const SliverToBoxAdapter(
                    child: BannerShimmer(),
                  )
                ],
                if (state is HomeRequestSuccessState) ...[
                  state.bannerList.fold((exceptionMessage) {
                    return const SliverToBoxAdapter(
                      child: Text(''),
                    );
                  }, (listBanners) {
                    return getBanners(listBanners);
                  })
                ],
                getCategory(),
                getCategoryListTitle(),
                getBestSellers(),
                getBestSellersList(),
                getMostView(),
                getMostViewList(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class getMostViewList extends StatelessWidget {
  const getMostViewList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 20),
                child: ProductItem(),
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
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 32),
        child: Row(
          children: [
            Image.asset('images/icon_left_categroy.png'),
            const SizedBox(width: 10),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                color: CustomColors.blueIndicator,
                fontFamily: 'SB',
              ),
            ),
            const Spacer(),
            const Text(
              ' پربازدید ترین ها',
              style: TextStyle(
                color: CustomColors.grey,
                fontSize: 12,
                fontFamily: 'SB',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getBestSellersList extends StatelessWidget {
  const getBestSellersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailScreen();
                        },
                      ),
                    );
                  },
                  child: ProductItem(),
                ),
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
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 20,
        ),
        child: Row(
          children: [
            Image.asset('images/icon_left_categroy.png'),
            const SizedBox(width: 10),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                color: CustomColors.blueIndicator,
                fontFamily: 'SB',
              ),
            ),
            const Spacer(),
            const Text(
              ' پرفروش ترین ها',
              style: TextStyle(
                color: CustomColors.grey,
                fontSize: 12,
                fontFamily: 'SB',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getCategoryListTitle extends StatelessWidget {
  const getCategoryListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CategoryIconItemList(),
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
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 32, top: 10),
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
                    'جست و جوی محصولات',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: CustomColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('images/icon_search.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
