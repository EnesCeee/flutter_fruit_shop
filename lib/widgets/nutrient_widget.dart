import 'package:flutter/material.dart';
import 'package:flutter_fruit_shop/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/data.dart';

class NutrientWidget extends StatelessWidget {
  const NutrientWidget({super.key, required this.product, required this.index});
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.nutrients[index][0],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Text(
              "${product.nutrients[index][1]}/5",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: product.nutrientsColor, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),

        // building the indicators
        Row(
          children: buildUndicators(product.nutrients[index][0], int.parse(product.nutrients[index][1])),
        )
      ]),
    );
  }

  List<Widget> buildUndicators(String nutrientType, int value) {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(i < value ? indicator(true, nutrientType) : indicator(false, nutrientType));
    }
    return list;
  }

  Widget indicator(bool isActive, String nutrientType) {
    IconData? icon;
    switch (nutrientType) {
      case 'Energy':
        icon = FontAwesomeIcons.bolt;
        break;
      case 'Freshness':
        icon = FontAwesomeIcons.glassWater;
        break;
      case 'Vitamin':
        icon = Icons.rocket_launch_rounded;
        break;
      case 'Calories':
        icon = FontAwesomeIcons.fire;
        break;
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
      child: Icon(
        icon,
        color: isActive == true ? product.nutrientsColor : Colors.black,
        size: 16,
      ),
    );
  }
}
