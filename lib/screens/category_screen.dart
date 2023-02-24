import 'package:book_shop/bloc/category/category_bloc.dart';
import 'package:book_shop/bloc/category/category_event.dart';
import 'package:book_shop/bloc/category/category_state.dart';
import 'package:book_shop/data/model/category.dart';
import 'package:book_shop/data/repository/category_repository.dart';
import 'package:book_shop/widgets/cached_image.dart';
import 'package:book_shop/widgets/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
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
                            ' دسته بندی',
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 700,
                      child: CategoryShimmer(),
                    ),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.response.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (r) {
                    return _listCategory(list: r);
                  });
                }
                return const SliverToBoxAdapter(child: Text('error'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _listCategory extends StatelessWidget {
  List<Category>? list;
  _listCategory({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CachedImage(imageUrl: list?[index].thumbnail);
        }, childCount: list?.length ?? 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
