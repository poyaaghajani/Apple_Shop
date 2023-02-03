import 'package:book_shop/widgets/detail_container.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Header(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 10,
                    (context, index) {
                      return CardItem();
                    },
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 70),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.green,
                  minimumSize: Size(MediaQuery.of(context).size.width, 53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'ادامه فرآیند خرید',
                  style: TextStyle(fontSize: 16, fontFamily: 'SM'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container CardItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 28, right: 28),
      width: 340,
      height: 239,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 17),
                      child: SizedBox(
                        width: 198,
                        height: 22,
                        child: FittedBox(
                          child: Text(
                            '..آیفون 13 پرومکس دو سیمکا',
                            style: TextStyle(fontSize: 22, fontFamily: 'SM'),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'گاراتنی 18 ماه مدیا پردازش',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'sm',
                            color: CustomColors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
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
                          const SizedBox(width: 5),
                          const Text(
                            'تومان',
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'sm',
                                color: CustomColors.grey),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '45,350,000',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'sm',
                                color: CustomColors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DetailContainer(
                            width: 108,
                            height: 24,
                            text: 'سبز کله غازی',
                            image:
                                const AssetImage('images/icon_top_buttom.png'),
                          ),
                          const SizedBox(width: 10),
                          DetailContainer(
                            width: 94,
                            height: 24,
                            text: '256 گیگابایت',
                            image:
                                const AssetImage('images/icon_top_buttom.png'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DetailContainer(
                            width: 64,
                            height: 24,
                            text: 'حذف',
                            image:
                                const AssetImage('images/icon_recyclebin.png'),
                          ),
                          const SizedBox(width: 10),
                          DetailContainer(
                            width: 69,
                            height: 24,
                            text: 'ذخیره',
                            image: const AssetImage(
                                'images/active_fav_product.png'),
                          ),
                          const SizedBox(width: 10),
                          DetailContainer(
                            width: 45,
                            height: 24,
                            text: '1',
                            image:
                                const AssetImage('images/icon_top_buttom.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 18),
                child: Column(
                  children: [
                    Image.asset('images/iphone.png'),
                  ],
                ),
              ),
            ],
          ),
          const DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: CustomColors.grey,
            dashGapLength: 4.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      'تومان',
                      style: TextStyle(fontSize: 13, fontFamily: 'sm'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '45,350,000',
                      style: TextStyle(fontSize: 16, fontFamily: 'sm'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding Header() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 32, top: 10),
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
                  'سبد خرید',
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
    );
  }
}
