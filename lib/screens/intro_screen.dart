import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fruit_shop/screens/home_screen.dart';
import 'package:flutter_fruit_shop/utils/colors.dart';
import 'package:flutter_fruit_shop/utils/padding_items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: ProjectPadding.pagePaddingHorizontal + ProjectPadding.pagePaddingVertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            ProjectString().headTitleText,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.1),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            ProjectString().titleOneText,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontSize: 60, color: Colors.black, fontWeight: FontWeight.w400, letterSpacing: 0.1),
          ),
          Text(
            ProjectString().titleTwoText,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.1),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            ProjectString().explanationText,
            style: const TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/bg.png"),
          ),
          const Spacer(),
          Column(
            children: [
              //slider
              SlideAction(
                outerColor: kPrimaryColor,
                sliderButtonIcon: const Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 20,
                  color: kPrimaryColor,
                ),
                text: ProjectString().sliderText,
                textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                onSubmit: () {
                  //delay of 500 milliseconds before next screen push
                  Timer(
                    const Duration(milliseconds: 500),
                    () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: ProjectString().supportTitleOneText,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                    ),
                    TextSpan(
                      text: ProjectString().supportTitleTwoText,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: kPrimaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}

class ProjectString {
  final String headTitleText = "HAY MARKETS";
  final String titleOneText = "First Online";
  final String titleTwoText = "Market";
  final String explanationText =
      "Our market always provide fresh items from the local farmers, let's support local with us !";
  final String supportTitleOneText = "HOW TO SUPPORT ";
  final String supportTitleTwoText = "LOCAL FARMERS";
  final String sliderText = "SWIPE TO START";
}
