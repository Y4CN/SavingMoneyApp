import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_app/constant/textStyleConst.dart';
import 'package:money_app/gen/assets.gen.dart';

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
            DelayedWidget(
              delayDuration: const Duration(milliseconds: 500),
              child: Lottie.asset(
                'assets/moneySaving2.json',
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
                  titleIntro[0],
                  style: TextStyleConst.titleTextStyleIntro,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 900),
                child: Text(desIntro[0]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
