import 'package:book_shop/data/model/category.dart';
import 'package:book_shop/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryIconItemList extends StatelessWidget {
  final Category category;
  const CategoryIconItemList(
    this.category, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                color: Color(hexColor),
                shadows: [
                  BoxShadow(
                    color: Color(hexColor),
                    blurRadius: 25,
                    spreadRadius: -13,
                    offset: const Offset(0.0, 15),
                  )
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            SizedBox(
              height: 24,
              width: 24,
              child: Center(
                child: CachedImage(
                  imageUrl: category.icon,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          category.title ?? '[خیار]',
          style: TextStyle(fontFamily: 'SB', fontSize: 13),
        ),
      ],
    );
  }
}
