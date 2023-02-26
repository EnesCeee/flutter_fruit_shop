import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fruit_shop/data/data.dart';
import 'package:flutter_fruit_shop/utils/colors.dart';
import 'package:flutter_fruit_shop/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: product.color,
        child: Stack(
          children: [
            // image of product
            Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: 2.05 * pi,
                child: Image.asset(
                  product.image,
                  height: 80,
                ),
              ),
            ),

            // heart icon
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: boxShadow),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: product.isSelected ? kPrimaryColor : Colors.black38,
                  size: 15,
                ),
              ),
            ),

            //product details
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      // product based box shadow
                      color: product.color.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: const Offset(0, 1))
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    priceWidget(product.price),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text("See More"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.arrowTrendUp,
                          color: kPrimaryColor,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
