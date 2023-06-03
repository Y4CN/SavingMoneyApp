import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_app/constant/colorConst.dart';
import 'package:money_app/constant/textStyleConst.dart';
import 'package:money_app/gen/assets.gen.dart';
import 'package:money_app/screens/homeScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

List<String> lotteAnimation = [
  'assets/savingMoney.json',
  'assets/flyingWalletMoney.json',
  'assets/moneySaving2.json',
];

List<String> titleIntro = [
  'Save your money conveniently.',
  'Secure your money for free and get rewards.',
  'Enjoy commission-free stock trading.',
];
List<String> desIntro = [
  'Get 5% cash back for each transaction and spend it easily.',
  'Get the most secure payment app ever and enjoy it.',
  'Online investing has never been easier than it is right now.',
];

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(Assets.images.logo.path),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              itemCount: lotteAnimation.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DelayedWidget(
                      delayDuration: const Duration(milliseconds: 500),
                      child: Lottie.asset(
                        lotteAnimation[index],
                        height: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: DelayedWidget(
                        delayDuration: const Duration(milliseconds: 700),
                        child: Text(
                          titleIntro[index],
                          style: TextStyleConst.titleTextStyleIntro,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: DelayedWidget(
                        delayDuration: const Duration(milliseconds: 900),
                        child: Text(
                          desIntro[index],
                          style: TextStyleConst.desTextStyleIntro,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: DelayedWidget(
                animationDuration: const Duration(milliseconds: 1100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: lotteAnimation.length,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConst.primaryColor.withOpacity(.4),
                          height: 10,
                          width: 10,
                          rotationAngle: 0,
                        ),
                        activeDotDecoration: DotDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConst.primaryColor,
                          height: 20,
                          width: 20,
                          rotationAngle: 0,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primaryColor,
                        minimumSize: const Size(150, 70),
                      ),
                      onPressed: () {
                        if (page < 2) {
                          _pageController.animateToPage(++page,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease);
                          setState(() {});
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      child: page < 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: TextStyleConst.titleTextStyleIntro
                                      .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Icon(
                                  CupertinoIcons.forward,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            )
                          : Text(
                              'Get Started',
                              style:
                                  TextStyleConst.titleTextStyleIntro.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
