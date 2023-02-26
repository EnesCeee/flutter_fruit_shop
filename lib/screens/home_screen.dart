import 'package:flutter/material.dart';
import 'package:flutter_fruit_shop/data/data.dart';
import 'package:flutter_fruit_shop/screens/details_screen.dart';
import 'package:flutter_fruit_shop/utils/colors.dart';
import 'package:flutter_fruit_shop/utils/utils.dart';
import 'package:flutter_fruit_shop/widgets/product_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/padding_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: ProjectPadding.pagePaddingHorizontal + ProjectPadding.pagePaddingVertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: kSecondaryColor,
              backgroundImage: AssetImage("assets/user.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome back,",
                  style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Park Hyung Sik",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            const Spacer(),
            //icon widget
            iconWidget(FontAwesomeIcons.bagShopping, true)
          ],
        ),
        const SizedBox(
          height: 30,
        ),

        //tagline
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "Get your fresh items \n",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.w400)),
            TextSpan(
                text: "with ",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 30, color: Colors.black87, fontWeight: FontWeight.w400)),
             TextSpan(
                text: "Hay Markets",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 35, color: Colors.black87, fontWeight: FontWeight.bold)),
          ]),
        ),
        const SizedBox(
          height: 30,
        ),

        //search bar
        Row(
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.70,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: boxShadow,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Search pineapple",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black38),
                  )
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
              child: const Icon(
                FontAwesomeIcons.filter,
                color: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  data[index].name,
                  style: TextStyle(
                      fontSize: 16,
                      color: index == 0 ? kPrimaryColor : Colors.black45,
                      fontWeight: index == 0 ? FontWeight.bold : FontWeight.w400),
                ),
              );
            },
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 40,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: data[0].products?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(product: data[0].products![index]),
                    ));
              },
              child: ProductWidget(
                product: data[0].products![index],
              ),
            );
          },
        )
      ]),
    )));
  }
}
