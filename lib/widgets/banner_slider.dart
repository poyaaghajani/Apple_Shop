import 'package:book_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/constants.dart';
import '../data/model/banner.dart';

class BannerSlider extends StatelessWidget {
  List<BannerCampain> bannerList;
  BannerSlider(
    this.bannerList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var controller = PageController(viewportFraction: 0.93);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: height / 4.5,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: CachedImage(
                  radius: 15,
                  imageUrl: bannerList[index].thumbnail,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 6,
              dotWidth: 6,
              dotColor: Colors.white,
              activeDotColor: CustomColors.blueIndicator,
            ),
          ),
        )
      ],
    );
  }
}
