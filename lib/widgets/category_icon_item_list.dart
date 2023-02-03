import 'package:flutter/material.dart';

class CategoryIconItemList extends StatelessWidget {
  const CategoryIconItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                color: Colors.teal,
                shadows: const [
                  BoxShadow(
                    color: Colors.teal,
                    blurRadius: 25,
                    spreadRadius: -13,
                    offset: Offset(0.0, 15),
                  )
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const Icon(
              Icons.mouse,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'همه',
          style: TextStyle(fontFamily: 'SB', fontSize: 13),
        ),
      ],
    );
  }
}
