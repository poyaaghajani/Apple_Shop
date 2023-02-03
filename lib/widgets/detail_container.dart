import 'package:book_shop/constants/constants.dart';
import 'package:flutter/material.dart';

class DetailContainer extends StatelessWidget {
  final double width;
  final double height;
  final text;
  final ImageProvider<Object> image;
  DetailContainer({
    Key? key,
    required this.width,
    required this.height,
    this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CustomColors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                color: CustomColors.grey,
                fontFamily: 'SM',
              ),
            ),
            Image(image: image)
          ],
        ),
      ),
    );
  }
}
