import 'package:book_shop/widgets/category_icon_item_list.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
            const Text(
              'پویا آقاجانی',
              style: TextStyle(fontFamily: 'sb', fontSize: 16),
            ),
            const Text(
              '09356162752',
              style: TextStyle(fontFamily: 'sm', fontSize: 11),
            ),
            const SizedBox(height: 30),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: const [
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                  // CategoryIconItemList(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
                color: CustomColors.grey,
              ),
            ),
            const Text(
              'v-1.0.00',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
                color: CustomColors.grey,
              ),
            ),
            const Text(
              'Instagram.com/_flutter.wings',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
                color: CustomColors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
